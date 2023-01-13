import 'package:flutter/material.dart';
import 'package:my_awesome_name_app/pages/my_home_page.dart';
import 'package:my_awesome_name_app/state/my_app_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: "Namer App",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF280042))),
        home: const MyHomePage(),
      ),
    );
  }
}
