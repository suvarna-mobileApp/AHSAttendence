import 'package:flutter/material.dart';
import '../Colours.dart';
import '../dashboard/Dashboard.dart';

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
    double screenHeight = MediaQuery.of(context).size.height;
    double halfScreenHeight = screenHeight / 2;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: ColorConstants.litegrey,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: halfScreenHeight,
          child:  ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
                bottomRight: Radius.circular(80),
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0)),
            child: Container(
              color: ColorConstants.kPrimaryColor,
             /* child: Image.asset(
                'assets/image/bg.jpg',
                fit: BoxFit.cover,
              ),*/
            ),
          ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 20.0),
              child: Image.asset(
                'assets/image/ahsfull.png',
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
        Center(
          child: Container(
            width: double.infinity,
            height: 200,
            margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
            ),
            child:  ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: new Text("Employee Id/Email Id",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: _buildTextFieldWIthoutBorder(
                        controller: nameController,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                    child: Container(
                        child: _buttons('Login', context)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

           /* Container(
              margin: EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 20.0),
              child: Image.asset(
                'assets/image/ahsfull.png',
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              color: ColorConstants.listbg,
              child:  ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    *//*Container(
                    margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFF05A22),
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),*//*
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: new Text("Employee Id/Email Id",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: _buildTextFieldWIthoutBorder(
                          controller: nameController,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                      child: Container(
                          child: _buttons('Login', context)
                      ),
                    ),
                  ],
                ),
              ),
            ),*/
           /* Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                *//*Container(
                    margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFF05A22),
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),*//*
                Padding(
              padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: new Text("Employee Id/Email Id",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
      ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: _buildTextFieldWIthoutBorder(
                      controller: nameController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                  child: Container(
                      child: _buttons('Login', context)
                  ),
                ),
              ],
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
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black,width: 0.5),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black,width: 0.5),
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
                      color: Colors.black,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ),
                    );
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