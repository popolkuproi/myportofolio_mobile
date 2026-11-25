import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myportofolio_mobile/config.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';

void main() {
  const projectJson = {
    'id': 'project-id',
    'title': 'Portfolio App',
    'description': 'A mobile portfolio',
    'tech_stack': 'Flutter',
    'project_url': 'https://example.com',
  };

  test('uses a browser-reachable default URL on web', () {
    expect(
      apiBaseUrl,
      kIsWeb ? 'http://localhost:8000' : 'http://10.0.2.2:8000',
    );
  });

  test('reads project data and defaults a missing image URL', () async {
    final client = ApiClient(
      baseUrl: 'https://api.example.com',
      client: MockClient((request) async {
        expect(request.url.path, '/api/v1/projects/');
        expect(request.headers['Accept'], 'application/json');
        return http.Response(jsonEncode([projectJson]), 200);
      }),
    );

    final projects = await client.getProjects();
    expect(projects.single.id, 'project-id');
    expect(projects.single.projectImageUrl, '');
  });

  test('creates a project using the token and omits the server ID', () async {
    final client = ApiClient(
      baseUrl: 'https://api.example.com',
      client: MockClient((request) async {
        expect(request.method, 'POST');
        expect(request.url.path, '/api/v1/projects/');
        expect(request.headers['Authorization'], 'Token secret');
        final body = jsonDecode(request.body) as Map;
        expect(body['title'], 'Portfolio App');
        expect(body.containsKey('id'), isFalse);
        return http.Response(jsonEncode(projectJson), 201);
      }),
    );

    final created = await client.createProject(
      const Project(
        id: 'client-id',
        title: 'Portfolio App',
        description: 'A mobile portfolio',
        techStack: 'Flutter',
        projectUrl: 'https://example.com',
      ),
      token: 'secret',
    );
    expect(created.id, 'project-id');
  });

  test('obtains and revokes an authentication token', () async {
    var requestNumber = 0;
    final client = ApiClient(
      baseUrl: 'https://api.example.com',
      client: MockClient((request) async {
        requestNumber++;
        if (requestNumber == 1) {
          expect(request.url.path, '/api/v1/auth/token/');
          expect(jsonDecode(request.body), {
            'username': 'student',
            'password': 'pass',
          });
          return http.Response('{"token":"secret"}', 200);
        }
        expect(request.url.path, '/api/v1/auth/logout/');
        expect(request.headers['Authorization'], 'Token secret');
        return http.Response('', 204);
      }),
    );

    expect(await client.obtainToken('student', 'pass'), 'secret');
    await client.logout(token: 'secret');
  });

  test('stores a token after successful login', () async {
    final client = ApiClient(
      baseUrl: 'https://api.example.com',
      client: MockClient((request) async {
        expect(request.url.path, '/api/v1/auth/token/');
        return http.Response('{"token":"new-token"}', 200);
      }),
    );
    final auth = AuthState(client);

    await auth.login('student', 'pass');

    expect(auth.isLoggedIn, isTrue);
    expect(auth.token, 'new-token');
  });

  test('clears local session even if server logout fails', () async {
    final client = ApiClient(
      baseUrl: 'https://api.example.com',
      client: MockClient((_) async => http.Response('unauthorized', 401)),
    );
    final auth = AuthState(client, initialToken: 'expired');

    await auth.logout();

    expect(auth.isLoggedIn, isFalse);
    expect(auth.token, isNull);
  });

  test('reports unsuccessful API responses with their status code', () async {
    final client = ApiClient(
      baseUrl: 'https://api.example.com',
      client: MockClient((_) async => http.Response('server error', 500)),
    );

    await expectLater(
      client.getProjects(),
      throwsA(
        isA<ApiException>().having(
          (error) => error.statusCode,
          'statusCode',
          500,
        ),
      ),
    );
  });
}
