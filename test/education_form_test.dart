import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/main.dart';

void main() {
  testWidgets(
    'education form validates, summarizes, and opens from navigation',
    (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const MyApp());

      await tester.tap(find.text('Tambah Edukasi'));
      await tester.pumpAndSettle();
      expect(find.text('Institusi Pendidikan'), findsOneWidget);

      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();
      expect(find.text('Nama institusi tidak boleh kosong.'), findsOneWidget);
      expect(find.text('Pilih jenjang pendidikan.'), findsOneWidget);
      expect(find.text('Edukasi berhasil ditambahkan!'), findsNothing);

      final fields = find.byType(TextFormField);
      await tester.ensureVisible(fields.at(0));
      await tester.enterText(fields.at(0), '   ');
      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();
      expect(find.text('Nama institusi tidak boleh kosong.'), findsOneWidget);

      await tester.enterText(fields.at(0), 'Universitas UI');
      await tester.tap(find.byType(DropdownButtonFormField<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('S1').last);
      await tester.pumpAndSettle();
      await tester.ensureVisible(fields.at(1));
      await tester.enterText(fields.at(1), 'Informatika');
      await tester.ensureVisible(fields.at(2));
      await tester.enterText(fields.at(2), '2020');
      await tester.ensureVisible(fields.at(3));
      await tester.enterText(fields.at(3), '2019');
      await tester.ensureVisible(find.text('Simpan'));
      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();
      expect(
        find.text('Tahun selesai tidak boleh sebelum tahun mulai.'),
        findsOneWidget,
      );
      expect(find.text('Edukasi berhasil ditambahkan!'), findsNothing);

      await tester.enterText(fields.at(3), '2024');
      await tester.tap(find.text('Simpan'));
      await tester.pumpAndSettle();

      expect(find.text('Edukasi berhasil ditambahkan!'), findsOneWidget);
      expect(find.text('Institusi: Universitas UI'), findsOneWidget);
      expect(find.text('Jenjang: S1'), findsOneWidget);
      expect(find.text('Jurusan: Informatika'), findsOneWidget);
      expect(find.text('Tahun mulai: 2020'), findsOneWidget);
      expect(find.text('Tahun selesai: 2024'), findsOneWidget);

      await tester.tap(find.text('Tutup'));
      await tester.pumpAndSettle();
      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(
        find.text('Selamat datang di MyPortfolio Mobile!'),
        findsOneWidget,
      );

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add Education'));
      await tester.pumpAndSettle();
      expect(find.text('Tambah Edukasi'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Home'));
      await tester.pumpAndSettle();
      expect(
        find.text('Selamat datang di MyPortfolio Mobile!'),
        findsOneWidget,
      );
    },
  );
}
