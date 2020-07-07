import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/services.dart';
import 'package:trampo/shared/helpers/service_locator.dart';

import 'modules/signin/splash_page.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return DynamicTheme(
      defaultBrightness: Brightness.light,
      data: (brightness) => ThemeData(
        brightness: brightness,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.indigo,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
        cursorColor: Colors.indigoAccent,
        textSelectionHandleColor: Colors.indigoAccent,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.indigo,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Trampo',
          theme: theme,
          home: SplashPage(),
        );
      },
    );
  }
}
