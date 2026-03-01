// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Kas Rumah';

  @override
  String get welcomeTitle => 'Selamat datang di Kas Rumah';

  @override
  String get tagline =>
      'Kelola anggaran keluarga lebih rapi, demi masa depan yang lebih pasti.';

  @override
  String get taglineAlternative =>
      'Bocoran pengeluaran terdeteksi, tabungan keluarga makin terkendali.';

  @override
  String get loginTitle => 'Masuk ke akun Anda';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailMissingError => 'Email tidak boleh kosong';

  @override
  String get emailInvalidError => 'Email tidak valid';

  @override
  String get passwordLabel => 'Kata sandi';

  @override
  String get loginButton => 'Masuk';

  @override
  String get registerButton => 'Daftar';

  @override
  String get registerTitle => 'Buat akun baru';

  @override
  String get nameLabel => 'Nama';

  @override
  String get confirmPasswordLabel => 'Konfirmasi kata sandi';

  @override
  String get alreadyHaveAccount => 'Sudah punya akun? Masuk';

  @override
  String get workspaceTitle => 'Workspace';
}
