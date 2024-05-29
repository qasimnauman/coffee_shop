// import 'package:coffee_shop/tab_item.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> with SingleTickerProviderStateMixin{
//   late final TabController _tabController = TabController(length: 2, vsync: this);

//   @override
//   void initState() {
//     super.initState();
//       _tabController.addListener(() {
//       setState(() {
//         _tabController.index;
//       });
//     });
//   }

//   bool _isobscure = true;
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           title: Text(
//              _tabController.index == 0 ? 'Let\'s Get You Signed In' : 'Let\'s Get You Registered',
//             style: GoogleFonts.sourceSans3(
//               fontSize: 31,
//               fontWeight: FontWeight.w600,
//               ),
//           ),
//           toolbarHeight: 80,
//           centerTitle: true,
//           bottom: PreferredSize(
//             preferredSize: const Size.fromHeight(50),
//             child: ClipRRect(
//               borderRadius: const BorderRadius.all(Radius.circular(10)),
//               child: Container(
//                 height: 50,
//                 margin: const EdgeInsets.symmetric(horizontal: 20),
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   color: Color.fromRGBO(245, 245, 245, 1),
//                 ),
//                 child: TabBar(
//                   controller: _tabController, // Pass the TabController here
//                   indicatorSize: TabBarIndicatorSize.tab,
//                   dividerColor: Colors.transparent,
//                   indicator:const BoxDecoration(
//                     color: Color.fromRGBO(214, 151, 93, 1),
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   labelColor: Colors.white,
//                   unselectedLabelColor: Colors.black54,
//                   tabs: [
//                     TabItem(
//                       pagetitle: 'SignIn',
//                       style: GoogleFonts.sourceSans3(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const TabItem(
//                       pagetitle: 'Register',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                   onTap: (index) {
//                   setState(() {
//                     _tabController.index = index;
//                   });
//                 },
//                 ),
//               ),
//             ),
//           ),
//         ),
//         body: TabBarView(
//             controller: _tabController, // Pass the TabController here
//             children: [
//             Column(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       hintText: 'Email',
//                       hintStyle: GoogleFonts.sourceSans3(
//                         fontSize: 14,
//                         color: const Color.fromRGBO(0, 0, 0, 0.25),
//                         fontWeight: FontWeight.w400,
//                       ),
//                       filled: true,
//                       fillColor: const Color.fromRGBO(237, 236, 236, 1),
//                       border: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         borderSide: BorderSide.none
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   child: TextFormField(
//                     obscureText: _isobscure,
//                     decoration: InputDecoration(
//                       hintText: 'Password',
//                       hintStyle: GoogleFonts.sourceSans3(
//                         fontSize: 14,
//                         color: const Color.fromRGBO(0, 0, 0, 0.25),
//                         fontWeight: FontWeight.w400,
//                       ),
//                       filled: true,
//                       fillColor: const Color.fromRGBO(237, 236, 236, 1),
//                       border: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         borderSide: BorderSide.none
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _isobscure ? Icons.visibility : Icons.visibility_off,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _isobscure = !_isobscure;
//                           });
//                         },
//                       ), 
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {

//                   },
//                   child: Container(
//                     padding: const EdgeInsets.only(top: 10),
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     child: Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         "Forgot Password ?",
//                         style: GoogleFonts.sourceSans3(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600,
//                         )
//                       ),
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   child: Container(
//                     height: 78,
//                     width: MediaQuery.of(context).size.width* 0.9,
//                     margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
//                       decoration: BoxDecoration(
//                       color: const Color.fromRGBO(214, 151, 83, 1),
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           spreadRadius: 1,
//                           blurRadius: 20,
//                           offset: const Offset(0, 3),
//                         ),
//                       ]
//                     ),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Sign In",
//                         style: GoogleFonts.sourceSans3(
//                           fontSize: 28,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       hintText: 'Name',
//                       hintStyle: GoogleFonts.sourceSans3(
//                         fontSize: 14,
//                         color: const Color.fromRGBO(0, 0, 0, 0.25),
//                         fontWeight: FontWeight.w400,
//                       ),
//                       filled: true,
//                       fillColor: const Color.fromRGBO(237, 236, 236, 1),
//                       border: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         borderSide: BorderSide.none
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       hintText: 'Email',
//                       hintStyle: GoogleFonts.sourceSans3(
//                         fontSize: 14,
//                         color: const Color.fromRGBO(0, 0, 0, 0.25),
//                         fontWeight: FontWeight.w400,
//                       ),
//                       filled: true,
//                       fillColor: const Color.fromRGBO(237, 236, 236, 1),
//                       border: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         borderSide: BorderSide.none
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
//                   width: MediaQuery.of(context).size.width * 0.9,
//                   child: TextFormField(
//                     obscureText: _isobscure,
//                     decoration: InputDecoration(
//                       hintText: 'Password',
//                       hintStyle: GoogleFonts.sourceSans3(
//                         fontSize: 14,
//                         color: const Color.fromRGBO(0, 0, 0, 0.25),
//                         fontWeight: FontWeight.w400,
//                       ),
//                       filled: true,
//                       fillColor: const Color.fromRGBO(237, 236, 236, 1),
//                       border: const OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                         borderSide: BorderSide.none
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _isobscure ? Icons.visibility : Icons.visibility_off,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _isobscure = !_isobscure;
//                           });
//                         },
//                       ), 
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   child: Container(
//                     height: 78,
//                     width: MediaQuery.of(context).size.width* 0.9,
//                     margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
//                       decoration: BoxDecoration(
//                       color: const Color.fromRGBO(214, 151, 83, 1),
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.2),
//                           spreadRadius: 1,
//                           blurRadius: 20,
//                           offset: const Offset(0, 3),
//                         ),
//                       ]
//                     ),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Text(
//                         "Register Now",
//                         style: GoogleFonts.sourceSans3(
//                           fontSize: 28,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:latlong2/latlong.dart';
// import 'login.dart'; // Import the login page
// import 'package:firebase_core/firebase_core.dart';


// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp()); // Replace with your main app widget
// }


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Maps Demo',
//       debugShowCheckedModeBanner: false,

//       initialRoute: '/', // Set initial route to login page
//       routes: {
//         '/': (context) => LoginPage(), // Define route for login page
//         '/home': (context) => MyHomePage(), // Define route for MyHomePage
//       },
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   String? _currentAddress;
//   Position? _currentPosition;

//   LatLng latLng = const LatLng(33.714046159992186, 73.02466472318214);


//   Future<bool> _handleLocationPermission() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text('Location services are disabled. Please enable the services')));
//       return false;
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Location permissions are denied')));
//         return false;
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text('Location permissions are permanently denied, we cannot request permissions.')));
//       return false;
//     }
//     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

//     return true;
//   }

//   Future<void> _getCurrentPosition() async {
//     final hasPermission = await _handleLocationPermission();
//     if (!hasPermission) return;
//     await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) {
//       setState(() => _currentPosition = position);
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }


//   MapController mapController = MapController();
//   List<LatLng> tappedPoints = [
//     const LatLng(33.71401046222639, 73.02473982502792),

//   ];

//   void _markLocation() async {
//     await _getCurrentPosition();
//     tappedPoints.add(LatLng(_currentPosition!.latitude, _currentPosition!.longitude));
//     if (_currentPosition != null) {
//       await Future.delayed(const Duration(milliseconds: 100), () {
//         mapController.move(LatLng(_currentPosition!.latitude, _currentPosition!.longitude), 15);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final markers = tappedPoints
//         .map((latlng) =>
//         Marker(
//           point: latlng,
//           child: const Icon(
//               Icons.location_on,
//               color: Colors.red,
//               size: 30),
//         )).toList();


//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),

//         actions: [
//           IconButton(
//             icon: const Icon(Icons.search),
//             onPressed: () {
//               // Implement search functionality
//               // For example, show a search dialog or navigate to a search page
//             },
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _markLocation,
//         child: Icon(Icons.my_location),
//       ),
//       body: Stack(
//         children: [
//           FlutterMap(
//             mapController: mapController,
//             options: MapOptions(
//                 initialCenter: latLng,
//                 initialZoom: 14,
//                 onTap: (_, latlng){
//                   setState(() {
//                     tappedPoints.add(latlng);
//                     debugPrint(latlng.toString());
//                   });
//                 }
//             ),
//             children: [
//               TileLayer(
//                 urlTemplate:
//                 'https://api.mapbox.com/styles/v1/bugbud1/clw1v0sz202go01qz3uj4gom2/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYnVnYnVkMSIsImEiOiJjbHZ5djl0NGwyZmNqMmlxemtza29wOW12In0.kDPRl-d_67Man82fwrgWuA',
//                 userAgentPackageName: 'com.example.googlemapexample',
//                 additionalOptions: const {
//                   'accessToken':
//                   'pk.eyJ1IjoiYnVnYnVkMSIsImEiOiJjbHZ5djl0NGwyZmNqMmlxemtza29wOW12In0.kDPRl-d_67Man82fwrgWuA',
//                   'id': 'mapbox.mapbox-streets-v8'
//                 },
//               ),

//               MarkerLayer(markers: markers),
//             ],
//           ),

//         ],
//       ),
//     );


//   }
// }