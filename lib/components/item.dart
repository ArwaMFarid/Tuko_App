// import 'package:flutter/material.dart';
// import 'package:toku/models/number.dart';
//
// class Item extends StatelessWidget {
//   const Item({super.key,required this.number});
//   final Number number;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: Color.fromARGB(255, 243, 85, 37),
//       height: 100,
//       child: Row(
//         children: [
//           Container(
//             color: Color(0xffFFF6DC),
//             child: Image.asset(number.Image),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   number.jpanissName,
//                   style: TextStyle(fontSize: 22, color: Colors.white),
//                 ),
//                 Text(
//                   number.englishName,
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//           Spacer(flex: 1),
//           Padding(
//             padding: const EdgeInsets.only(right: 10),
//             child: Icon(Icons.play_arrow, color: Colors.white, size: 30),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({super.key});
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
