import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetScreen extends StatefulWidget {
  static const String page = "reset";
  const ResetScreen({Key? key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  late String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text('รีเซ็ต รหัสผ่าน'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(hintText: 'อิเมล์'),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "กดปุ่ม  ยืนยัน  1 ครั้งเพื่อส่ง",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    child: Text('ยืนยัน'),
                    onPressed: () {
                      auth.sendPasswordResetEmail(email: _email);
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    child: Text('กลับหน้าหลัก'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
