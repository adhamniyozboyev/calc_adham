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

  TextEditingController second1 = TextEditingController();
  TextEditingController second2 = TextEditingController();
  TextEditingController second3 = TextEditingController();

  TextEditingController third1 = TextEditingController();
  TextEditingController third2 = TextEditingController();
  TextEditingController third3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(backgroundColor: Colors.green,
        body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          // color: Colors.green,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'image/sea.jpg',
                  ),
                  fit: BoxFit.fill
                  )),
          child: Column(
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
                          fillColor: Colors.white),
                      controller: value1,
                    )),
                Text('nisbati',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Container(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white),
                      controller: value2,
                    )),
                Text('  =',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Container(
                    width: 100,
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white),
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white),
                      controller: second1,
                    )),
                Text('foizi',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Container(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white),
                      controller: second2,
                    )),
                Text('=',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Container(
                    width: 100,
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white),
                      controller: second3,
                    )),
              ]),
              ElevatedButton(
                  onPressed: () {
                    num ans =
                        (int.parse(second1.text) / int.parse(second2.text)) *
                            100;
                    setState(() {
                      second3.text = ans.toString();
                    });
                  },
                  child: Text('Calculate2')),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white),
                      controller: third1,
                    )),
                Text('ga foizi ',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Container(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white),
                      controller: third2,
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
                          fillColor: Colors.white),
                      controller: third3,
                    )),
              ]),
              ElevatedButton(
                  onPressed: () {
                    num ans =
                        int.parse(third2.text) / int.parse(third1.text) * 100;
                    setState(() {
                      third3.text = ans.toString();
                    });
                  },
                  child: Text('Calcuate3')),
            ],
          ),
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
