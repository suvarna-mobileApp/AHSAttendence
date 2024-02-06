import 'package:attendence/dashboard/Dashboard.dart';
import 'package:flutter/material.dart';
import '../Colours.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ViewProfileExample(),
    );
  }
}

class ViewProfileExample extends StatefulWidget {
  const ViewProfileExample({super.key});

  @override
  State<ViewProfileExample> createState() =>
      _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfileExample> with TickerProviderStateMixin {

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
    double halfScreenHeight = screenHeight / 4;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ColorConstants.kPrimaryColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Dashboard(),
              ),
            );
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: ColorConstants.kPrimaryColor,
            fontFamily: 'Montserrat',// Text color
            fontSize: 18, // Font size
            fontWeight: FontWeight.bold, // Font weight
          ),
        ),
          backgroundColor: Colors.white,
        centerTitle: true, // Center the title horizontally
      ),
      body: SingleChildScrollView(
        child: Stack(
            children: [
        Container(
        width: double.infinity,
      height: halfScreenHeight,
      child:  ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0)),
          child: Container(
            color: ColorConstants.kPrimaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: ColorConstants.kPrimaryColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: new Text("PROFILE",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Center(
                    child: Text(''),
                  ),
                ),
              ],
            ),
          ),
      ),
        ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 20.0),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: new Text("Suvarna Varadaraju",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                      child: new Text("IY01854",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                      child: new Text("Senior Mobile Developer",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                      child: CircleAvatar(
                        radius: 80.0,
                        backgroundColor: ColorConstants.kPrimaryColor,
                        backgroundImage: AssetImage('assets/image/icon_profile1.png'),
                      )
                  ),
                ),
              )

            ],
        )
       /* child: Stack(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: ColorConstants.kPrimaryColor,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: new Text("PROFILE",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        child: Center(
                          child: Text(''),
                        ),
                      ),
                    ],
                  ),
                  *//* child: Image.asset(
                'assets/image/bg.jpg',
                fit: BoxFit.cover,
              ),*//*
                ),
              ),
            ),
            Center(
              child: Container(
                width: double.infinity,
                height: 300,
                margin: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 20.0),
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
                      Align(
                        alignment: Alignment.topCenter,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/image/icon_profile1.png'),
                          backgroundColor: ColorConstants.kPrimaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: new Text("Suvarna Varadaraju",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                        child: new Text("IY01854",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                        child: new Text("Senior Mobile Developer",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),*/
      ),
    );
  }
}