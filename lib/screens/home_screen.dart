import 'package:flutter/material.dart';
import 'package:training_brain/widgets/menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      drawer: const Menu(),
      body: const Center(
        child: Text("Home Screen"),
      ),
    );
  }
}