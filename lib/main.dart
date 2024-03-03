import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Map dictionaryEncode = {
  "a": 1,
  "b": 2,
  "c": 3,
  "d": 4,
  "e": 5,
  "f": 6,
  "g": 7,
  "h": 8,
  "i": 9,
  "j": 10,
  "k": 11,
  "l": 12,
  "m": 13,
  "n": 14,
  "o": 15,
  "p": 16,
  "q": 17,
  "r": 18,
  "s": 19,
  "t": 20,
  "u": 21,
  "v": 22,
  "w": 23,
  "x": 24,
  "y": 25,
  "z": 26,
};

var dictionaryEncodeReversed = dictionaryEncode.map((k, v) => MapEntry(v, k));

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController controller = new TextEditingController();
  final TextEditingController controller2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          )),
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 30),
              TextField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'To encrypt, Paste or Type here!!',
                  counterText: '',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
                onSubmitted: (String decryptText) {
                  setState(
                    () {
                      controller2.text = encryptor(decryptText);
                      controller.text = "";
                    },
                  );
                },
                controller: controller,
              ),
              ElevatedButton(
                  child: Text(
                    'Encrypt',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    controller2.text = encryptor(controller.text);
                    controller.text = "";
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.lightGreen),
                  )),
              SizedBox(height: 20),
              TextField(
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'To decrypt, Paste or Type here!!',
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  fillColor: Colors.white,
                  filled: true,
                ),
                onSubmitted: (String encryptText) {
                  setState(
                    () {
                      controller.text = decryptor(encryptText);
                      controller2.text = "";
                    },
                  );
                },
                controller: controller2,
              ),
              ElevatedButton(
                  child: Text(
                    'Decrypt',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    controller.text = decryptor(controller2.text);
                    controller2.text = "";
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.lightGreen),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

String encryptor(String textToEncrypt) {
  String enText_out = "";
  int convt;
  String c_out;

  for (int i = 0; i < textToEncrypt.length; i++) {
    try {
      convt = dictionaryEncode[textToEncrypt[i]];
      if (convt < 25) {
        convt = convt + 2;
      } else if (convt == 25) {
        convt = 1;
      } else if (convt == 26) {
        convt = 2;
      }
      c_out = dictionaryEncodeReversed[convt];
      print("not lol");
    } catch (lo) {
      c_out = textToEncrypt[i];
      print("lol");
    }
    enText_out = enText_out + c_out;
  }
  return enText_out;
}

String decryptor(String textToDecrypt) {
  String deText_out = "";
  int convt;
  String c_out;

  for (int i = 0; i < textToDecrypt.length; i++) {
    try {
      convt = dictionaryEncode[textToDecrypt[i]];
      if (convt > 2) {
        convt = convt - 2;
      } else if (convt == 2) {
        convt = 26;
      } else if (convt == 1) {
        convt = 25;
      }
      c_out = dictionaryEncodeReversed[convt];
      print("not lol");
    } catch (lo) {
      c_out = textToDecrypt[i];
      print("lol");
    }
    deText_out = deText_out + c_out;
  }

  return deText_out;
}
