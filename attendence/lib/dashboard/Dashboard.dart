import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import '../Colours.dart';
import '../profile/ViewProfile.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DashboardExample(),
    );
  }
}

class DashboardExample extends StatefulWidget {
  const DashboardExample({super.key});

  @override
  State<DashboardExample> createState() =>
      _DashboardExampleState();
}

class _DashboardExampleState extends State<DashboardExample> with TickerProviderStateMixin {
  String currentDate = DateFormat.yMMMMd('en_US').format(DateTime.now());
  String currentTime = DateFormat.jm().format(DateTime.now());
  late GoogleMapController mapController;
  late LatLng showLocation = const LatLng(25.0953478, 55.1702784);
  final Set<Marker> markers = new Set();

  @override
  void initState() {
    super.initState();
    getmarkers();
  }

  Set<Marker> getmarkers() { //markers to place on map
    setState(() {
      markers.add(Marker( //add first marker
        markerId: MarkerId(""),
        position: showLocation, //position of marker
        infoWindow: InfoWindow( //popup info
          //title: 'Corporate Office'
          //snippet: 'Damac executive heights',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });

    return markers;
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: ColorConstants.kPrimaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),*/
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: ColorConstants.kPrimaryColor,
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
              // Add button press logic here
            },
          ),
        ],
        centerTitle: true, // Center the title horizontally
        backgroundColor: Colors.white, // AppBar background color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
          margin: EdgeInsets.fromLTRB(20.0, 20, 20.0, 0),
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
            Container(
              width: double.infinity,
              height: 400,
              margin: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
              child: GoogleMap( //Map widget from google_maps_flutter package
                zoomGesturesEnabled: true, //enable Zoom in, out on map
                initialCameraPosition: CameraPosition( //innital position in map
                  target: showLocation, //initial position
                  zoom: 11.0, //initial zoom level
                ),
                markers: getmarkers(), //markers to show on map
                mapType: MapType.normal, //map type
                onMapCreated: (controller) { //method called when map is created
                  setState(() {
                    mapController = controller;
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
                child: _buttons('Check-In',context)
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