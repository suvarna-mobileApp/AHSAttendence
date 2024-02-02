import 'package:flutter/material.dart';

import '../Colours.dart';

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
  final TextEditingController nameController = TextEditingController();

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
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/image/bg.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.centerLeft,
                  child: new Text("Employee Id/Email Id",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: _buildTextFieldWIthoutBorder(
                    controller: nameController,
                  ),
                ),
                Container(
                    child: _buttons('Login', context)
                ),
              ],
            ),
           /* Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                //color: ColorConstants.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.centerLeft,
                    child: new Text("Employee Id/Email Id",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: _buildTextFieldWIthoutBorder(
                      controller: nameController,
                    ),
                  ),
                  Container(
                      child: _buttons('Login', context)
                  ),
                ],
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWIthoutBorder({
    required TextEditingController controller,
    TextInputType? inputType,
    int? maxLines,
  }) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.kPrimaryColor,width: 0.5),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorConstants.kPrimaryColor,width: 0.5),
          ),
        ),
      ),
    );
  }
  Widget _buttons(name, BuildContext context) {
    return Center(
        child: ButtonBar(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ButtonTheme(
                minWidth: 200,
                child: ElevatedButton(
                  child: new Text(name,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    primary: ColorConstants.kPrimaryColor,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onPressed: () {

                  },
                )),
          ],
        ));
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