import 'package:flutter/material.dart';

class Mycalc extends StatefulWidget {
  const Mycalc({Key? key}) : super(key: key);

  @override
  State<Mycalc> createState() => _MycalcState();
}

class _MycalcState extends State<Mycalc> {
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();
  TextEditingController value3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        // backgroundColor: Color.fromARGB(255, 242, 214, 223),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromARGB(255, 230, 237, 88)),
                    controller: value1,
                  )),
              Text('%',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Container(
                  width: 100,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromARGB(255, 230, 237, 88)),
                    controller: value2,
                  )),
              Text(' =',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              Container(
                  width: 100,
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromARGB(255, 230, 237, 88)),
                    controller: value3,
                  )),
            ]),
            ElevatedButton(
                onPressed: () {
                  num ans =
                      int.parse(value1.text) / 100 * int.parse(value2.text);
                  setState(() {
                    value3.text = ans.toString();
                  });
                },
                child: Text('Calculate')),
            Row()
          ],
        ),
      );
    });
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Mycalc(),
  ));
}
