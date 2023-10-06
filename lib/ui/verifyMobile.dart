import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rov_clone/ui/homeScreen.dart';

import '../Utils/commonComponents/button.dart';
import '../Utils/commonComponents/editText.dart';

class VerifyMobile extends StatefulWidget {
  const VerifyMobile({super.key});

  @override
  State<VerifyMobile> createState() => _VerifyMobileState();
}

class _VerifyMobileState extends State<VerifyMobile> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Verify Mobile Number')),
      ),
      body: Center(child: _body()),
    );
  }

  Widget _body() {
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: const BorderRadius.all(
            Radius.circular(10.0) //                 <--- border radius here
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "A one-time password (OTP) has been sent to your registered phone number.",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,),
            textAlign: TextAlign.center,
          ),
          EditText(
            labelText: "Enter OTP",
            myController: myController,
            maxLen: 6,
            inputType: TextInputType.number,
            onChange: (text) {
              if (kDebugMode) {
                print("========$text");
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Resend OTP"),
              Text("Login with password"),
            ],
          ),
          Button(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            btnText: "Verify",
          )
        ],
      ),
    );
  }
}
