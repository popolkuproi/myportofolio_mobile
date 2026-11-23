import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _institutionController = TextEditingController();
  final _majorController = TextEditingController();
  final _startYearController = TextEditingController();
  final _endYearController = TextEditingController();
  String? _degree;

  final List<String> _degrees = ['D3', 'D4', 'S1', 'S2', 'S3'];

  @override
  void dispose() {
    _institutionController.dispose();
    _majorController.dispose();
    _startYearController.dispose();
    _endYearController.dispose();
    super.dispose();
  }

  String? _validateYear(String? value, {int? minYear}) {
    final year = int.tryParse(value?.trim() ?? '');
    final currentYear = DateTime.now().year;
    if (year == null || year < 1950 || year > currentYear) {
      return 'Masukkan tahun antara 1950 dan $currentYear.';
    }
    if (minYear != null && year < minYear) {
      return 'Tahun selesai tidak boleh sebelum tahun mulai.';
    }
    return null;
  }

  void _showSummary() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edukasi berhasil ditambahkan!'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Institusi: ${_institutionController.text.trim()}'),
              Text('Jenjang: $_degree'),
              Text('Jurusan: ${_majorController.text.trim()}'),
              Text('Tahun mulai: ${_startYearController.text.trim()}'),
              Text(
                'Tahun selesai: ${_endYearController.text.trim().isEmpty ? 'Masih berlangsung' : _endYearController.text.trim()}',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Edukasi'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _institutionController,
                decoration: const InputDecoration(
                  labelText: 'Institusi Pendidikan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Nama institusi tidak boleh kosong.'
                    : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Jenjang Pendidikan',
                  border: OutlineInputBorder(),
                ),
                initialValue: _degree,
                items: _degrees
                    .map(
                      (degree) =>
                          DropdownMenuItem(value: degree, child: Text(degree)),
                    )
                    .toList(),
                onChanged: (value) => setState(() => _degree = value),
                validator: (value) =>
                    value == null ? 'Pilih jenjang pendidikan.' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _majorController,
                decoration: const InputDecoration(
                  labelText: 'Jurusan / Program Studi',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Jurusan tidak boleh kosong.'
                    : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _startYearController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Tahun Mulai',
                  border: OutlineInputBorder(),
                ),
                validator: _validateYear,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _endYearController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Tahun Selesai (opsional)',
                  helperText: 'Kosongkan jika masih berlangsung.',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return null;
                  return _validateYear(
                    value,
                    minYear: int.tryParse(_startYearController.text.trim()),
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) _showSummary();
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
