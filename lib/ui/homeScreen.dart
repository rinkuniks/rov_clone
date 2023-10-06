import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rov_clone/Utils/Assets.dart';
import 'package:rov_clone/Utils/commonComponents/button.dart';
import 'package:rov_clone/Utils/commonComponents/editText.dart';
import 'package:rov_clone/ui/enterMobile.dart';
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
  String? version = "2.4";

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
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(Assets.profileImage),
                      const Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: Icon(Icons.camera_alt)),
                    ],
                  ),
                  const Text(
                    "Username",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const Text(
                    "0000000000",
                    style: TextStyle(color: Colors.white),
                  ),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    maxRating: 5,
                    itemSize: 15,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Text(
                    "Version $version",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt_outlined),
              title: const Text('My Request'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('My favorites'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_card),
              title: const Text('Manage Cards'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(Icons.question_answer),
              title: const Text('FAQs'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                //clear the storage and Shared prefs
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnterMobileScreen()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
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
