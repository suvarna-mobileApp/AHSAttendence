import 'dart:convert';
import 'package:attendence/dashboard/Dashboard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Colours.dart';
import '../model/profile/viewprofile.dart';

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
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  void getToken() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoading = true;
      final String token = prefs.getString('token').toString();
      print(token);
      Profile("IY01482",token);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double halfScreenHeight = screenHeight / 4;
    double ScreenHeight = screenHeight / 2;

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
      body: isLoading?
        progressBar(context) : SingleChildScrollView(
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
                margin: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 20.0),
                width: double.infinity,
                height: ScreenHeight,
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
                      padding: const EdgeInsets.fromLTRB(20.0,5.0,20.0,0.0),
                      child: new Text("Senior Mobile Developer",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 70,
                      padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Image(
                                    image: AssetImage(
                                        'assets/image/icon_user_grey.png')),
                              ),
                              Container(
                                height: 20,
                                width: 2, // Adjust the thickness of the line
                                color: Colors.grey, // Color of the vertical line
                              ),
                              Expanded(
                                child: Image(
                                    image: AssetImage(
                                        'assets/image/icon_doc_gold.png')),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
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

  Profile(String empId,String token) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token
    };
    var data = json.encode({
      "_empId": empId
    });
    var dio = Dio();
    var response = await dio.request(
      'https://ahsca7486d9b32c9b0ddevaos.axcloud.dynamics.com/api/services/AHSMobileServices/AHSMobileService/getProfile',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      viewprofile data = viewprofile.fromJson(response.data);
      print(data.visa);
      //_launchURL(data.visa);
    } else {
      setState(() {
        isLoading = false;
      });
      print(response.statusMessage);
    }
  }

  _launchURL(String mapurl) async {
    await launchUrl(Uri.parse(mapurl));
  }

  Widget progressBar(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
          color: ColorConstants.kPrimaryColor,
          strokeWidth: 3,
        ));
  }
}