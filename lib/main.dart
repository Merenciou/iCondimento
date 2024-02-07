import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_condimento/homepage.dart';
import 'package:i_condimento/temperos_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Color(0xFFA6CF98)));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFA6FF96), primary: const Color(0xFFA6FF96).withOpacity(0.5), secondary: const Color(0xFFFFA447)),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/temperos_page': (context) => const TemperosPage(),
        },
        home: const Homepage(),
      ),
    );
  }
}
