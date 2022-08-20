import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pac/screens/game.dart';
import 'controllers/villainGereneratorController.dart';

double tileSize = 16;
int moedas = 0;
double lifePlayer = 100;

void main() {
  BonfireInjector.instance.put((i) => VillainGenerator());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
    // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgsProject',
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff2a562f), useMaterial3: true),
      home: Game(),
    );
  }
}


