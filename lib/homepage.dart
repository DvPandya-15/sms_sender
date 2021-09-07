import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final smsController = TextEditingController();
  final numberController = TextEditingController();
  final List<String> recipent = [];
  String sms = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sms Sender"),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: numberController,
              decoration: InputDecoration(
                hintText: "Enter Number",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: smsController,
              decoration: InputDecoration(
                hintText: "Type a message",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                recipent.add(numberController.text);
                setState(() {
                  sms = smsController.text;
                });
                _sendSMS(sms, recipent);
                print(sms);
              },
              child: Text(
                "Send SMS",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.redAccent)),
            )
          ],
        ),
      ),
    );
  }
}

void _sendSMS(String msg, List<String> number) async {
  try {
    String result = await sendSMS(message: msg, recipients: number);
  } catch (e) {
    print(e.toString());
  }
}
