import 'package:flutter/material.dart';

class signIn extends StatelessWidget {
  const signIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: signInExample(),
    );
  }
}

class signInExample extends StatefulWidget {
  const signInExample({super.key});

  @override
  State<signInExample> createState() =>
      _signInExampleExampleState();
}

class _signInExampleExampleState extends State<signInExample> with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: Image.asset(
                'assets/image/bg.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double getTextSize(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    if (screenSize.shortestSide < 600) {
      // This is a phone (iPhone or similar)
      return 16; // Adjust the margin for iPhones
    } else {
      // This is a tablet (iPad or similar)
      return 22; // Adjust the margin for iPads
    }
  }
}