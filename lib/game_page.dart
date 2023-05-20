import 'dart:math';

import 'package:flutter/material.dart';

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  int referenceNumber = 1;
  int generatedNumber = 1;
  int score = 0;
  bool numbersMatched = false;

  @override
  void initState() {
    super.initState();
    referenceNumber = generateRandomNumber();
    generatedNumber = 0;
    score = 0;
  }

  int generateRandomNumber() {
    Random random = Random();
    return random.nextInt(6) + 1;
  }

  void checkNumbers() {
    int newGeneratedNumber = generateRandomNumber();
    if (generatedNumber == referenceNumber) {
      setState(() {
        score += 10;
        referenceNumber = generateRandomNumber();
        numbersMatched = true;
      });
    } else {
      numbersMatched = false;
    }

    setState(() {
      generatedNumber = newGeneratedNumber;
      if (generatedNumber != 0 && generatedNumber == referenceNumber) {
        score += 10;
        referenceNumber = generateRandomNumber();
        numbersMatched = true;
      }
    });
  }

  void restartGame() {
    setState(() {
      referenceNumber = generateRandomNumber();
      generatedNumber = 0;
      score = 0;
      numbersMatched = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[500],
      appBar: AppBar(
        title: Text('Dice Game'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: restartGame,
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      '$referenceNumber',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Material(
                  child: InkWell(
                    onTap: checkNumbers,
                    splashColor: Colors.amber,
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.amber,
                      child: Center(
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$generatedNumber',
                                key: ValueKey(generatedNumber),
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.amber,
                  child: Center(
                    child: Text(
                      'Score: $score',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (numbersMatched)
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.all(8),
                child: Text(
                  'Number Has Matched : +10',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
