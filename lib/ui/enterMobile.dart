import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rov_clone/Utils/Assets.dart';
import 'package:rov_clone/Utils/commonComponents/button.dart';
import 'package:rov_clone/Utils/commonComponents/editText.dart';
import 'package:rov_clone/ui/verifyMobile.dart';

class EnterMobileScreen extends StatefulWidget {
  const EnterMobileScreen({super.key});

  @override
  State<EnterMobileScreen> createState() => _EnterMobileScreenState();
}

class _EnterMobileScreenState extends State<EnterMobileScreen> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Enter Mobile Number')),
      ),
      body: Center(child: _body()),
    );
  }

  @override
  void initState() {
    super.initState();
    myController.addListener(_latestValue);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 130, height: 130, child: Image.asset(Assets.logo)),
          const Text(
            "Please enter your mobile number to book a ride or parcel "
            "delivery.",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,),
            textAlign: TextAlign.center,
          ),
          EditText(
            labelText: "Enter Mobile Number",
            myController: myController,
            maxLen: 10,
            inputType: TextInputType.number,
            onChange: (text) {
              if (kDebugMode) {
                print("========$text");
              }
            },
          ),
          Button(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VerifyMobile()),
              );
            },
            btnText: "Book Now",
            mWidth: 200,
          )
        ],
      ),
    );
  }

  void _latestValue() {
    if (kDebugMode) {
      print("---${myController.text}");
    }
  }
}
