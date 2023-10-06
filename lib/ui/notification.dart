import 'package:flutter/material.dart';
import 'package:rov_clone/ui/homeScreen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Center(child: Text('Notifications')),
        ),
        body: Center(child: _body()),
      ),
    );
  }

  Widget _body() {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) => const Padding(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "New Notification will be shown to you as pre the "
                    "new data falls",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ));
  }
}
