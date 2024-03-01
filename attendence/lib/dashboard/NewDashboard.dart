import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import '../Colours.dart';
import '../profile/ViewProfile.dart';
import 'NavDrawer.dart';

class NewDashboard extends StatelessWidget {
  const NewDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NewDashboardExample(),
    );
  }
}

class NewDashboardExample extends StatefulWidget {
  const NewDashboardExample({super.key});

  @override
  State<NewDashboardExample> createState() =>
      _DashboardExampleState();
}

class _DashboardExampleState extends State<NewDashboardExample> with TickerProviderStateMixin {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  String currentDate = DateFormat.yMMMMd('en_US').format(DateTime.now());
  String currentTime = DateFormat.jm().format(DateTime.now());
  late GoogleMapController mapController;
  late Marker currentLocaMarker;
  late LatLng showLocation = const LatLng(25.09554209900229, 55.17285329480057);
  double damaclat = 25.09554209900229;
  double damaclong = 55.17285329480057;
  double salelat = 25.09554209900229;
  double salelonf = 25.09554209900229;
  late LocationData currentLocation;
  Location location = Location();
  late StreamSubscription<LocationData> _locationSubscription;
  final Set<Marker> markers = new Set();
  Set<Circle> circles = new Set();
  String checkedInText = "Punch-In";
  String checkedInTextDate = "Punch-In";
  bool showText = false;


  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings(onDidReceiveLocalNotification: null);
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: null);

    getCurrentLocation();
    getCircle();
    getmarkers();
  }

  addCurrentLocMarker(LocationData locationData){
    /// Current Location marker, that will also be updating
    currentLocaMarker = Marker(
      markerId: MarkerId('currentLocation'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: LatLng(locationData!.latitude!, locationData!.longitude!),
      infoWindow: InfoWindow(title: 'Current Location', snippet: 'my location'),
      onTap: () {
        print('current location tapped');
      },
    );
  }

  void getCurrentLocation() async{
    Location location = Location();
    location.getLocation().then((value){
      currentLocation = value;
      /// add Markers for current location
      addCurrentLocMarker(currentLocation);
    });

    _locationSubscription = location.onLocationChanged.listen((newLoc) {
      setState(() {
        /// update the currentLocation with new location value
        currentLocation = newLoc;
        // We have to also update the markers by passing the new location value
        addCurrentLocMarker(newLoc);
      });
    });

    location.onLocationChanged.listen((newLoc) {

      var distanceBetween = haversineDistance(
          LatLng(damaclat, damaclong), LatLng(
          newLoc.latitude!, newLoc.longitude!));
      print('distance between... ${distanceBetween}');


      if (distanceBetween < 200) {
        print('user reached to the destination...');

        scheduleNotification(
            "Georegion added", "Your geofence has been added! - damac");

        /// I simply show a snackBar message here you can implement your custom logic here.
        /*ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('You reached to the location',
                style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.redAccent,)
          );*/
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('You reached to the location',
              style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.redAccent,)
        );

        scheduleNotification(
            "Georegion added", "You are outside radius");
      }
    });
  }

  Future<void> scheduleNotification(String title, String subtitle) async {
    print("scheduling one with $title and $subtitle");
    var rng = new Random();
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.high,
        priority: Priority.high,
        ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        rng.nextInt(100000), title, subtitle, platformChannelSpecifics,
        payload: 'item x');
    /* Future.delayed(Duration(seconds: 2)).then((result) async {
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
          'your channel id', 'your channel name',
          importance: Importance.high,
          priority: Priority.high,
          ticker: 'ticker');
      var iOSPlatformChannelSpecifics = IOSNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: iOSPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
          rng.nextInt(100000), title, subtitle, platformChannelSpecifics,
          payload: 'item x');
    });*/
  }

  dynamic haversineDistance(LatLng player1, LatLng player2) {
    double lat1 = player1.latitude;
    double lon1 = player1.longitude;
    double lat2 = player2.latitude;
    double lon2 = player2.longitude;

    var R = 6371e3; // metres
    // var R = 1000;
    var phi1 = (lat1 * pi) / 180; // φ, λ in radians
    var phi2 = (lat2 * pi) / 180;
    var deltaPhi = ((lat2 - lat1) * pi) / 180;
    var deltaLambda = ((lon2 - lon1) * pi) / 180;

    var a = sin(deltaPhi / 2) * sin(deltaPhi / 2) +
        cos(phi1) * cos(phi2) *
            sin(deltaLambda / 2) *
            sin(deltaLambda / 2);

    var c = 2 * atan2(sqrt(a), sqrt(1 - a));

    var d = R * c; // in metres


    return d;
  }

  void changeName(String buttonName, String textName){
    setState(() {
      currentDate = DateFormat.yMMMMd('en_US').format(DateTime.now());
      currentTime = DateFormat.jm().format(DateTime.now());
      buttonName = checkedInText;
      textName = checkedInTextDate;
    });
  }

  Set<Marker> getmarkers() {
    setState(() {
      markers.add(Marker(
        markerId: MarkerId(""),
        position: showLocation,
        infoWindow: InfoWindow(
          title: 'Corporate Office',
          snippet: 'Damac executive heights',
        ),
        icon: BitmapDescriptor.defaultMarker,
        onTap: () => "Damac executive heights",
      ));
    });

    return markers;
  }

  Set<Circle> getCircle() {
    setState(() {
      circles = Set.from([
        Circle(
          circleId: CircleId('geo_fence_1'),
          center: LatLng(damaclat, damaclong),
          radius: 200,
          strokeWidth: 2,
          strokeColor: ColorConstants.lite_gold,
          fillColor: ColorConstants.kPrimaryColor.withOpacity(0.15),
        ),
      ]);
    });

    return circles;
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstants.kPrimaryColor),
        /*leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          color: ColorConstants.kPrimaryColor,
          onPressed: () {
          },
        ),*/
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Montserrat',// Text color
            fontSize: 18, // Font size
            fontWeight: FontWeight.bold, // Font weight
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active),
            color: ColorConstants.kPrimaryColor,
            onPressed: () {
              scheduleNotification(
                  "Georegion added", "Your geofence has been added! - damac");
              // Add button press logic here
            },
          ),
        ],
        backgroundColor: ColorConstants.kPrimaryColor, // AppBar background color
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
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
                  /* child: Image.asset(
                'assets/image/bg.jpg',
                fit: BoxFit.cover,
              ),*/
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      child: Container(
                          width: 100,
                          height: 100,
                          child: Image.asset(
                            'assets/image/icon_profile1.png',
                            fit: BoxFit.cover,
                          )
                      ),
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewProfile(),
                          ),
                        ),
                      }
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text("Suvarna",
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                        ),
                        Container(
                          child: Text(currentDate,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                        ),
                        Container(
                          child: new Text(currentTime,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                        ),
                        InkWell(
                            child: Container(
                              child: new Text("View Profile",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w600,
                                  color: ColorConstants.kPrimaryColor,
                                ),
                              ),
                            ),
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewProfile(),
                                ),
                              ),
                            }
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
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
                    if(checkedInText == "Punch-In"){
                      showText = true;
                      _checkIn(context);
                      checkedInText = "Punch-Out";
                      checkedInTextDate = 'Punched In Damac Executive heights \n' + currentDate + " " + currentTime;
                      changeName(checkedInText,checkedInTextDate);
                    }else if(checkedInText == "Punch-Out"){
                      showText = true;
                      _checkIn(context);
                      checkedInTextDate = 'Punched Out Damac Executive heights \n' + currentDate + " " + currentTime;
                      checkedInText = "Punch-In";
                      changeName(checkedInText,checkedInTextDate);
                    }
                  },
                )),
          ],
        ));
  }

  Widget _checkIn(BuildContext context) {
    return Center(
      child: Container(
        child: new Text(checkedInTextDate,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  String dateTime(BuildContext context){
    final now = new DateTime.now();
    String formatter = DateFormat.yMMMMd('en_US').format(now);
    return formatter;
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