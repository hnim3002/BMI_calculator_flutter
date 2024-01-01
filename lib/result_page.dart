import 'package:flutter/material.dart';
import 'color_schemes.g.dart';


class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.result, required this.bmi, required this.interpretation});

  final String result;
  final String bmi;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 5, 0, 20),
              child: Text(
                "Your Result",
                style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Expanded(
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: lightColorScheme.primaryContainer,
                  margin: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                    children: [
                      Text(
                        result,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: result == 'Normal' ? Colors.green : Colors.redAccent
                        ),
                      ),
                      Text(
                        bmi,
                        style: TextStyle(
                            fontSize: 90,
                            color: lightColorScheme.onPrimaryContainer,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Opacity(
                        opacity: 0.7,
                        child: Text(
                          interpretation,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: lightColorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
                  backgroundColor:
                  MaterialStateProperty.all(lightColorScheme.primary),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "RE-CALCULATE",
                  style: TextStyle(
                      letterSpacing: 1,
                      color: lightColorScheme.onPrimary,
                      fontSize: 20,
                      height: 3.5),
                ),
              ),
            )
          ],
        ),
      ),
    );






  }
}
