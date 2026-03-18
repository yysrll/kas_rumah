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
  String get titleLogin => 'Masuk ke akun Anda';

  @override
  String get titleRegister => 'Buat akun baru';

  @override
  String get buttonLogin => 'Masuk';

  @override
  String get buttonRegister => 'Daftar';

  @override
  String get labelEmail => 'Email';

  @override
  String get errorEmailRequired => 'Email tidak boleh kosong';

  @override
  String get errorEmailInvalid => 'Email tidak valid';

  @override
  String get labelPassword => 'Kata sandi';

  @override
  String get labelConfirmPassword => 'Konfirmasi kata sandi';

  @override
  String get errorPasswordRequired => 'Kata sandi tidak boleh kosong';

  @override
  String get errorPasswordTooShort =>
      'Kata sandi harus terdiri dari minimal 6 karakter';

  @override
  String get errorPasswordMismatch =>
      'Kata sandi dan konfirmasi kata sandi tidak cocok';

  @override
  String get labelName => 'Nama';

  @override
  String get errorNameRequired => 'Nama tidak boleh kosong';

  @override
  String get confirmPasswordLabel => 'Konfirmasi kata sandi';

  @override
  String get actionAlreadyHaveAccount => 'Sudah punya akun? Masuk';

  @override
  String get actionDontHaveAccount => 'Belum punya akun? Daftar';

  @override
  String get workspaceTitle => 'Workspace';

  @override
  String get overviewTitle => 'Ikhtisar';

  @override
  String get overviewMonthlySnapshotTitle => 'Ringkasan Bulanan';

  @override
  String get overviewAvgDailySpend => 'Rata-rata Pengeluaran Harian';

  @override
  String get overviewWithinBudgetCaption =>
      'Kerja bagus! Pengeluaran Anda masih dalam anggaran.';

  @override
  String get overviewExceedingBudgetCaption =>
      'Waspada! Pengeluaran Anda sudah melebihi anggaran.';

  @override
  String get overviewTransactionsCaption => 'Ringkasan Transaksi';

  @override
  String get transactionsTitle => 'Transaksi';

  @override
  String get transactionsFilterByMonth => 'Filter berdasarkan bulan';

  @override
  String get transactionsNoData => 'Belum ada transaksi untuk bulan ini.';

  @override
  String get budgetsTitle => 'Anggaran';

  @override
  String budgetRemaining(num remaining) {
    final intl.NumberFormat remainingNumberFormat =
        intl.NumberFormat.compactCurrency(
          locale: localeName,
          symbol: 'IDR ',
          decimalDigits: 0,
        );
    final String remainingString = remainingNumberFormat.format(remaining);

    return 'Sisa $remainingString';
  }

  @override
  String get insightsTitle => 'Wawasan';

  @override
  String get insightTotalSpent => 'Total Terpakai';

  @override
  String get settingsTitle => 'Pengaturan';

  @override
  String get profileTitle => 'Profil';

  @override
  String get seeMore => 'Lihat lebih';

  @override
  String get selectMonth => 'Pilih bulan';
}
