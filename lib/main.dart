import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kas_rumah/core/config/kas_config.dart';
import 'package:kas_rumah/core/di/injector.dart';
import 'package:kas_rumah/core/route/app_router.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:kas_rumah/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:kas_rumah/l10n/app_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // setup supabase
  await Supabase.initialize(
    url: KasConfig.supabaseUrl,
    anonKey: KasConfig.supabaseKey,
  );

  // setup dependency injection
  await configureDependencies();

  // run app
  runApp(const MyApp());
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Add your BlocProviders here, e.g.:
        BlocProvider(create: (_) => getIt<AuthCubit>()),
      ],
      child: GlobalLoaderOverlay(
        overlayWidgetBuilder: (progress) {
          return Center(
            child: SpinKitFadingCircle(
              size: 50.0,
              color: context.colorScheme.primary,
            ),
          );
        },
        child: MaterialApp.router(
          routerConfig: _appRouter.config(),
          onGenerateTitle: (context) => context.strings.appTitle,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
  }
}
