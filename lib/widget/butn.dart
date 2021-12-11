import 'package:calculator/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final int fillColor;
  final Color textColor;
  final double textSize;
  final Function callback;
  static const co = Color(0xff22252D);
  const Button({
    Key? key,
    required this.text,
    required this.fillColor,
    this.textColor = co,
    this.textSize = 28,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () {
            callback(text);
          },
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.rubik(
                textStyle: TextStyle(
                  fontSize: textSize,
                ),
              ),
            ),
          ),
          color: Color(fillColor),
          textColor: textColor,
        ),
      ),
    );
  }
}
