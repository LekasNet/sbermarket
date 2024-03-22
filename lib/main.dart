import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sbermarket/pages/mian_page.dart';

import 'commons/colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Делаем статус бар прозрачным
      statusBarIconBrightness: Brightness.dark, // Темные иконки для светлого фона
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFFFFF),
          surfaceTint: Colors.transparent,
        ),
        cardColor: Colors.white,
        scaffoldBackgroundColor: Color(0xFFFFF5F5),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return primaryColor.withOpacity(0.5);
                  } else if (states.contains(MaterialState.disabled)) {
                    return greyColor;
                  }
                  return primaryColor;
                }),
          )
        ),
      ),
      home: Home(),
    );
  }
}


