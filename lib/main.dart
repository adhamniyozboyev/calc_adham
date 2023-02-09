import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color change=Colors.orange;
  TextEditingController controller = TextEditingController();
  Widget exp(String b, [Color col2 = Colors.orange]) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: col2,
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

  Widget wid(String a, [Color col = Colors.black]) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            fixedSize: Size(40, 65),
            backgroundColor: col,
            surfaceTintColor: col),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 370,
          ),
          TextField(
            style: TextStyle(fontSize: 40),
            textAlign: TextAlign.end,
            readOnly: true,
            controller: controller,
            decoration: InputDecoration(
                hintText: '0', hintStyle: TextStyle(fontSize: 40)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fixedSize: Size(40, 65),
                      backgroundColor: Colors.blue),
                  onPressed: () {
                    controller.text = '';
                  },
                  child: Text(
                    'C',
                    style: TextStyle(fontSize: 30.0),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fixedSize: Size(40, 65),
                      backgroundColor: Colors.blue),
                  onPressed: () {
                    //  controller.text=controller.text*controller.text;
                  },
                  child: Text(
                    'X2',
                    style: TextStyle(fontSize: 25),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fixedSize: Size(40, 65),
                      backgroundColor: Colors.blue),
                  onPressed: () {
                    controller.text = controller.text.substring(0, controller.text.length-1);
                  }, child: Icon(Icons.backspace_outlined)),
              exp('/')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              wid('7'),
              wid('8'),
              wid('9'),
              exp(
                'x',
              )
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [wid('4'), wid('5'), wid('6'), exp('-')]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [wid('1'), wid('2'), wid('3'), exp('+')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                            ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Colors.red,
                      fixedSize: Size(40, 65)),
                  onPressed: () {
                    
                  },
                  child:(Icon(Icons.palette))),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Colors.black,
                      fixedSize: Size(40, 65)),
                  onPressed: () {
                    controller.text += '0';
                  },
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 30),
                  )),
              wid('.'),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Colors.orange,
                      fixedSize: Size(40, 65.1)),
                  onPressed: () {
                    String exp = '+-x/';
                    List<int> ind = [];
                    //amallarni indexini olish
                    for (int i = 0; i < controller.text.length; i++) {
                      if (exp.contains(controller.text[i])) {
                        ind.add(i);
                      }
                    }

                    // raqamlarni olish
                    List<num> numbers = [];
                    int q = 0;
                    for (int i in ind) {
                      numbers.add(num.parse(controller.text.substring(q, i)));
                      q = i + 1;
                    }
                    numbers.add(
                        num.parse(controller.text.substring(ind.last + 1)));

                    for (int i = 0; i < ind.length; i++) {
                      if (controller.text[ind[i]] == 'x') {
                        numbers[i] = numbers[i] * numbers[i + 1];
                        numbers.removeAt(i + 1);
                        ind.removeAt(i);
                        i--;
                      } else if (controller.text[ind[i]] == '/') {
                        numbers[i] = numbers[i] / numbers[i + 1];
                        numbers.removeAt(i + 1);
                        ind.removeAt(i);
                        i--;
                      }
                    }

                    for (int i = 0; i < ind.length; i++) {
                      if (controller.text[ind[i]] == '+') {
                        numbers[i] = numbers[i] + numbers[i + 1];
                        numbers.removeAt(i + 1);
                        ind.removeAt(i);
                        i--;
                      } else if (controller.text[ind[i]] == '-') {
                        numbers[i] = numbers[i] - numbers[i + 1];
                        numbers.removeAt(i + 1);
                        ind.removeAt(i);
                        i--;
                      }
                    }

                    controller.text = numbers[0].toStringAsFixed(4);
                  },
                  child: Text('='))
            ],
          )
        ],
      ),
    );
  }
}
