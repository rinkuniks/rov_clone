import 'dart:core';

import 'package:flutter/material.dart';
import 'package:rov_clone/Utils/Assets.dart';
import 'package:rov_clone/Utils/commonComponents/button.dart';
import 'package:rov_clone/Utils/commonComponents/editText.dart';
import 'package:rov_clone/ui/notification.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pickController = TextEditingController();
  final dropController = TextEditingController();
  int selectedOption = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    pickController.dispose();
    dropController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notification_important_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationScreen()));
            },
          ),
        ],
        title: const Center(child: Text('Home')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _body(),
          bottomUi(),
        ],
      ),
    );
  }

  Widget _body() {
    return Column(
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        EditText(
          labelText: "Pick-up Location",
          myController: pickController,
        ),
        EditText(
          labelText: "Drop Location",
          myController: dropController,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ListTile(
                title: const Text('Book A Ride'),
                leading: Radio(
                  value: 1,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListTile(
                title: const Text('Book A Parcel'),
                leading: Radio(
                  value: 2,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 2,
        ),
      ],
    );
  }

  Widget bottomUi() {
    return Container(
      padding: const EdgeInsets.all(12),
      height: MediaQuery.of(context).size.height * 0.22,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Divider(
            thickness: 2,
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return _rideListView(
                      imageUrl: null, rideName: "Max", amount: "1.6");
                }),
          ),
          const SizedBox(
            height: 8,
          ),
          Button(
            onPressed: () {},
            btnText: "Book Now",
            mWidth: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }

  Widget _rideListView({String? imageUrl, String? rideName, String? amount}) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(imageUrl ?? Assets.taxiImage),
            Text(rideName ?? "Standard"),
            Text('\$ $amount ' "/mi" ?? "\$ 1.5/mi"),
          ],
        ),
      ),
    );
  }
}
