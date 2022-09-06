import 'package:flutter/material.dart';

import './Screens/Categories.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'DeliFoods',
        ),
        elevation: 0,
      ),
      body: CategoryScreen(),
    );
  }
}
