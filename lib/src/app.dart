import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:zini_task/src/homepage/homepage_view.dart';
import 'package:zini_task/src/login/login_page_view.dart';
import 'package:zini_task/src/provider/message_sync.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,

      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case LoginPageView.routeName:
                return const LoginPageView();
              case HomePageView.routeName:
                return ChangeNotifierProvider(
                  create: (context) => MessageSync(),
                  child: const HomePageView());
              default:
                return const LoginPageView();
            }
          },
        );
      },
    );
  }
}
