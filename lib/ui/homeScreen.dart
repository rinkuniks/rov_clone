import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pickController = TextEditingController();
  final dropController = TextEditingController();

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
          icon: Icon(Icons.menu),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.notification_important_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
        title: const Center(child: Text('Home')),
      ),
      body: Center(child: _body()),
    );
  }

  Widget _body() {
    return Container();
  }
}
