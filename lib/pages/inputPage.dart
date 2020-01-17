import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/iconContentWidget.dart';
import '../widgets/reusableCard.dart';

const double bottomContainerHeight = 80.0;
const Color activeCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);
const Color bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor, femaleCardColor;

  @override
  void initState() {
    this.maleCardColor = inactiveCardColor;
    this.femaleCardColor = inactiveCardColor;
    super.initState();
  }

  // 0 - Male, 1 - Female
  void updateColor(int gender) {
    if (gender == 0) {
      if (this.maleCardColor == inactiveCardColor) {
        setState(() {
          this.maleCardColor = activeCardColor;
          this.femaleCardColor = inactiveCardColor;
        });
      } else {
        setState(() {
          this.maleCardColor = inactiveCardColor;
        });
      }
    } else {
      if (this.femaleCardColor == inactiveCardColor) {
        setState(() {
          this.femaleCardColor = activeCardColor;
          this.maleCardColor = inactiveCardColor;
        });
      } else {
        setState(() {
          this.femaleCardColor = inactiveCardColor;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              child: Row(children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateColor(0);
                    },
                    child: ReusableCard(
                      cardColor: this.maleCardColor,
                      cardContent: IconContentWidget(
                        icon: FontAwesomeIcons.mars,
                        text: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateColor(1);
                    },
                    child: ReusableCard(
                      cardColor: this.femaleCardColor,
                      cardContent: Center(
                          child: IconContentWidget(
                        text: "FEMALE",
                        icon: FontAwesomeIcons.venus,
                      )),
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: Color(0xFF1D1E33),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      cardColor: Color(0xFF1D1E33),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardColor: Color(0xFF1D1E33),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
