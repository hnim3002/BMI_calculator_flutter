import 'dart:async';

import 'package:bmi_calculator_flutter/calculator.dart';
import 'package:bmi_calculator_flutter/result_page.dart';
import 'package:flutter/material.dart';
import 'color_schemes.g.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  var heightValue = 150;
  var weightValue = 50;
  var ageValue = 20;

  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _stopIncrement() {
    _timer?.cancel();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Can Not Calculate Your BMI'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please select your gender.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      function: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      cardChild: CustomIconContent(
                        icon: Icons.male,
                        iconText: "MALE",
                        color: selectedGender == Gender.male
                            ? lightColorScheme.onPrimaryContainer
                            : null,
                      ),
                      color: selectedGender == Gender.male
                          ? lightColorScheme.primaryContainer
                          : null,
                    ),
                  ),
                  Expanded(
                    child: CustomContainer(
                      function: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      cardChild: CustomIconContent(
                        icon: Icons.female,
                        iconText: "FEMALE",
                        color: selectedGender == Gender.female
                            ? lightColorScheme.onPrimaryContainer
                            : null,
                      ),
                      color: selectedGender == Gender.female
                          ? lightColorScheme.primaryContainer
                          : null,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomContainer(
                function: () {},
                color: lightColorScheme.primaryContainer,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.6,
                      child: Text(
                        "HEIGHT",
                        style: TextStyle(
                            color: lightColorScheme.onPrimaryContainer,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        IntrinsicWidth(
                          child: TextField(
                            onSubmitted: (String value) {
                              setState(() {
                                heightValue = int.parse(value);
                              });
                            },
                            style: TextStyle(
                                color: lightColorScheme.onPrimaryContainer,
                                fontSize: 50.0,
                                fontWeight: FontWeight.w900,
                                height: 0.8),
                            controller: TextEditingController(
                                text: heightValue.toString()),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "cm",
                          style: TextStyle(
                            color: lightColorScheme.onPrimaryContainer,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                      child: Slider(
                          value: heightValue.toDouble(),
                          max: 300,
                          min: 100,
                          label: heightValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              heightValue = value.round();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: CustomContainer(
                    function: () {},
                    color: lightColorScheme.primaryContainer,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: 0.6,
                          child: Text(
                            "WEIGHT",
                            style: TextStyle(
                                color: lightColorScheme.onPrimaryContainer,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          weightValue.toString(),
                          style: TextStyle(
                              color: lightColorScheme.onPrimaryContainer,
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900,
                              height: 0.8),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTapDown: (_) {
                                _timer = Timer.periodic(
                                    const Duration(milliseconds: 100), (timer) {
                                  setState(() {
                                    weightValue--;
                                  });
                                });
                              },
                              onTapCancel: () => _stopIncrement(),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    weightValue--;
                                  });
                                },
                                style: kRoundBtnStyle,
                                child: const Icon(Icons.remove),
                              ),
                            ),
                            GestureDetector(
                              onTapDown: (_) {
                                _timer = Timer.periodic(
                                    const Duration(milliseconds: 100), (timer) {
                                  setState(() {
                                    weightValue++;
                                  });
                                });
                              },
                              onTapCancel: () => _stopIncrement(),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      weightValue++;
                                    });
                                  },
                                  style: kRoundBtnStyle,
                                  child: const Icon(Icons.add)),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: CustomContainer(
                    function: () {},
                    color: lightColorScheme.primaryContainer,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: 0.6,
                          child: Text(
                            "AGE",
                            style: TextStyle(
                                color: lightColorScheme.onPrimaryContainer,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          ageValue.toString(),
                          style: TextStyle(
                              color: lightColorScheme.onPrimaryContainer,
                              fontSize: 50.0,
                              fontWeight: FontWeight.w900,
                              height: 0.8),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTapDown: (_) {
                                _timer = Timer.periodic(
                                    const Duration(milliseconds: 100), (timer) {
                                  setState(() {
                                    ageValue--;
                                  });
                                });
                              },
                              onTapCancel: () => _stopIncrement(),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    ageValue--;
                                  });
                                },
                                style: kRoundBtnStyle,
                                child: const Icon(Icons.remove),
                              ),
                            ),
                            GestureDetector(
                              onTapDown: (_) {
                                _timer = Timer.periodic(
                                    const Duration(milliseconds: 100), (timer) {
                                  setState(() {
                                    ageValue++;
                                  });
                                });
                              },
                              onTapCancel: () => _stopIncrement(),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    ageValue++;
                                  });
                                },
                                style: kRoundBtnStyle,
                                child: const Icon(Icons.add),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: SizedBox(
                width: double.infinity,
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
                    var cal = CalculatorBmi(heightValue, weightValue);

                    selectedGender == null
                        ? _showMyDialog()
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultPage(
                                      result: cal.getResult(),
                                      bmi: cal.getCalculateBMI(),
                                      interpretation: cal.getInterpretation(),
                                    )),
                          );
                  },
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(
                        letterSpacing: 1,
                        color: lightColorScheme.onPrimary,
                        fontSize: 20,
                        height: 3.5),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomIconContent extends StatelessWidget {
  const CustomIconContent(
      {super.key, required this.icon, required this.iconText, this.color});

  final IconData icon;
  final String iconText;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: color,
          size: 80.0,
        ),
        Opacity(
          opacity: 0.6,
          child: Text(
            iconText,
            style: TextStyle(
              fontSize: 18.0,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key, this.color, this.cardChild, required this.function});
  final Color? color;
  final Widget? cardChild;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: color,
        margin: const EdgeInsets.all(15.0),
        child: Container(
          child: cardChild,
        ),
      ),
    );
  }
}
