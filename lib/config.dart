import 'package:flutter/foundation.dart';

/// Base URL for the Django REST Framework backend.
/// Override for Chrome with --dart-define=API_BASE_URL=http://localhost:8000.
const String apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: kIsWeb ? 'http://localhost:8000' : 'http://10.0.2.2:8000',
);
