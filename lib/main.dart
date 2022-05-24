
import 'package:api_rest/api_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Melanated Monarchy',
      color: const Color.fromRGBO(231, 198, 142, 1),
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(231, 198, 142, 1),
        splashColor: const Color.fromRGBO(231, 198, 142, 0.7),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
          color: const Color.fromRGBO(231, 198, 142, 1),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber).copyWith(secondary: const Color.fromRGBO(231, 198, 142, 0.7)),
        textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
      ),
      home: APIUI(),
    );
  }
}



