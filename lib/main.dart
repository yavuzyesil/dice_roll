import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;
  final diceColor = Colors.amberAccent;
  final lMarPad = const EdgeInsets.all(32.0);
  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: lMarPad,
                  child: InkWell(
                    onTap: rollDice,
                    child: Image.asset("images/dice$leftDiceNumber.png",
                        color: diceColor),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: lMarPad,
                  child: InkWell(
                    onTap: rollDice,
                    child: Image.asset("images/dice$rightDiceNumber.png",
                        color: diceColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
