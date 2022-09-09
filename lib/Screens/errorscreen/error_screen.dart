import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            'Sorry, Could not load page',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ));
  }
}
