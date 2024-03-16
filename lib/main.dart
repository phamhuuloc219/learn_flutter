import 'package:flutter/material.dart';
import 'package:learn_flutter/page_home.dart';

void main() {
  runApp(const MyApp());
}

/////////////////////////////////////////////////////////////////////////////////////////////
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
//         useMaterial3: true,
//       ),
//       // home: const MyHomePage(title: 'Home Page'),
//       home: const ListViewPage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
// // class _MyHomePageState extends State<HoaHauPage> {
// //   String tet = "Tết đến rồi";
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //         title: const Text("63.CNTT-1"),
// //       ),
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Center(
// //             child: Center(
// //                 child: Text(
// //               tet,
// //               style: const TextStyle(
// //                 color: Colors.red,
// //                 fontSize: 30,
// //               ),
// //             )),
// //           ),
// //           ElevatedButton(
// //               onPressed: () {
// //                 // phương thức set báo cho framework vẽ lại ưidget bằng cách gọi lại phương thức bulid
// //                 setState(() {
// //                   if (tet == "Tết đến rồi") {
// //                     tet = "Hết tết";
// //                   } else {
// //                     tet = "Tết đến rồi";
// //                   }
// //                 });
// //               },
// //               child: const Text("go home"))
// //         ],
// //       ),
// //     );
// //   }
// // }
////////////////////////////////////////////////////////////////////////////

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PageHome(),
    );
  }
}