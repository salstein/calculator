import 'package:calculator/constants/style.dart';
import 'package:calculator/widget/butn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _history = '';
  String _expression = '';
  

  void numClick(String text) {
    setState(() => _expression += text);
  }



  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression
        .replaceAll(String.fromCharCode(0x00D7), "*")
        .replaceAll(String.fromCharCode(0x00F7), "/"));
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: dark,
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            color: dark,
            child: Column(
              children: [
                // The Light and dark mode Button
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.0541,
                        width: MediaQuery.of(context).size.width * 0.31,
                        decoration: BoxDecoration(
                            color: darkBtnBck,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4.5),
                              child: IconButton(
                                  onPressed: () {
                                  },
                                  icon: Icon(Icons.light_mode_outlined,
                                      color: Color(0xff55585F))),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 4.5),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.dark_mode_outlined,
                                    color: white,
                                  )),
                            )
                          ],
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      _history,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF545F61),
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      _expression,
                      style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  alignment: Alignment(1.0, 1.0),
                ),
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                color: darkBtnBck,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.6,
              child: Column(
                children: [
                  Row(children: [
                    Spacer(),
                    Button(
                      text: 'AC',
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: allClear,
                      textColor: textGreen,
                    ),
                    Button(
                      text: "+/-",
                      fillColor: 0xff22252D,
                      textSize: 15,
                      callback: () {},
                      textColor: textGreen,
                    ),
                    Button(
                      text: '%',
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: () {},
                      textColor: textGreen,
                    ),
                    Button(
                      text: String.fromCharCode(0x00F7),
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: numClick,
                      textColor: btnRed,
                    ),
                    Spacer(),
                  ]),
                  Row(children: [
                    Spacer(),
                    Button(
                      text: '7',
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: numClick,
                      textColor: white,
                    ),
                    Button(
                      text: '8',
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: numClick,
                      textColor: white,
                    ),
                    Button(
                      text: '9',
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: numClick,
                      textColor: white,
                    ),
                    Button(
                      text: String.fromCharCode(0x00D7),
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: numClick,
                      textColor: btnRed,
                    ),
                    Spacer(),
                  ]),
                  Row(children: [
                    Spacer(),
                    Button(
                      text: '4',
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: numClick,
                      textColor: white,
                    ),
                    Button(
                      text: '5',
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: numClick,
                      textColor: white,
                    ),
                    Button(
                      text: '6',
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: numClick,
                      textColor: white,
                    ),
                    Button(
                      text: '-',
                      fillColor: 0xff22252D,
                      textSize: 20,
                      callback: numClick,
                      textColor: btnRed,
                    ),
                    Spacer(),
                  ]),
                  Row(children: [
                    Spacer(),
                    Button(
                      text: '1',
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: numClick,
                      textColor: white,
                    ),
                    Button(
                      text: '2',
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: numClick,
                      textColor: white,
                    ),
                    Button(
                      text: '3',
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: numClick,
                      textColor: white,
                    ),
                    Button(
                      text: String.fromCharCode(0x002B),
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: numClick,
                      textColor: btnRed,
                    ),
                    Spacer(),
                  ]),
                  Row(children: [
                    Spacer(),
                    Button(
                      text: "⟲",
                      fillColor: 0xff22252D,
                      textSize: 35,
                      callback: allClear,
                      textColor: white,
                    ),
                    Button(
                      text: '0',
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: numClick,
                      textColor: white,
                    ),
                    Button(
                      text: '.',
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: numClick,
                      textColor: white,
                    ),
                    Button(
                      text: '=',
                      fillColor: 0xff22252D,
                      textSize: 22,
                      callback: evaluate,
                      textColor: btnRed,
                    ),
                    Spacer(),
                  ]),
                ],
              )),
        ]),
      ),
    );
  }
}
