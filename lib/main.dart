import 'package:calc_adham/foiz.dart';
import 'package:calc_adham/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color change = Colors.orange;
  Color change2 = Colors.black;
  Color change3 = Colors.blue;
  int val = 1;
  int check = 0;
  Widget reo = Container();
  Widget radios = Container();
  TextEditingController controller = TextEditingController();
  Widget exp(
    String b,
  ) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: change,
          fixedSize: Size(40, 65),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: (() {
          if (controller.text[controller.text.length - 1] == '-') {
            controller.text =
                controller.text.substring(0, controller.text.length - 1);
          } else if (controller.text[controller.text.length - 1] == '+') {
            controller.text =
                controller.text.substring(0, controller.text.length - 1);
          } else if (controller.text[controller.text.length - 1] == 'x') {
            controller.text =
                controller.text.substring(0, controller.text.length - 1);
          } else if (controller.text[controller.text.length - 1] == '/') {
            controller.text =
                controller.text.substring(0, controller.text.length - 1);
          }
          controller.text += b;
        }),
        child: Text(
          b,
          style: TextStyle(fontSize: 30),
        ));
  }

  Widget wid(
    String a,
  ) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          fixedSize: Size(40, 65),
          backgroundColor: change2,
        ),
        onPressed: () {
          controller.text += a;
        },
        child: Text(
          a,
          style: TextStyle(fontSize: 30),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      drawer: Drawer(
          child: Column(
        children: [
          Container(
              height: 100,
              child: Text(
                '\n\nQanaqa kalkulyator kerak ?',
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.brown,
                ),
                textAlign: TextAlign.center,
              )),
          RadioListTile(
              title: Text('Hisob uchun '),
              value: 1,
              groupValue: val,
              onChanged: ((v) {
                setState(() {
                  val = 1;
                });
              })),
          RadioListTile(
              title: Text('Foiz uchun'),
              value: 2,
              groupValue: val,
              onChanged: ((v) {
                setState(() {
                  val = 2;
                });
              })),
        ],
      )),
      appBar: AppBar(
          title: Center(
        child: Text('Adham'),
      )),
      body: val == 1 ? Calculator() : Mycalc(),
    );
  }
}
