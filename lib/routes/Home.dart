import 'package:flutter/material.dart';
import 'package:retail_store_management_system/routes/HeadBar.dart';
import 'package:retail_store_management_system/routes/NavBar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HeadBar(),
      body: NavBar(),
    );
  }
}
