// import 'package:flutter/material.dart';
// import 'package:flutter_getx_tamplete/screens/controller/Theatre_Controller.dart';
// import 'package:get/get.dart';
//
// class InfoTilesWidget extends StatelessWidget {
//   const InfoTilesWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final TheatreController controller = Get.find<TheatreController>();
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     final List<double> leftPositions = [
//       screenWidth * 0.00,
//       screenWidth * 0.30,
//       screenWidth * 0.60,
//     ];
//
//     return Obx(() {
//       final items = controller.items;
//       return SizedBox(
//         height: 110,
//         child: Stack(
//           children: List.generate(items.length, (index) {
//             final item = items[index];
//             return Positioned(
//               left: leftPositions[index],
//               top: 0,
//               width: screenWidth * 0.33,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: 9,
//                     height: 9,
//                     decoration: const BoxDecoration(
//                       color: Color(0xFFF5A623),
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     item.title,
//                     style: const TextStyle(
//                       color: Color(0xFFF5A623),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 11.5,
//                     ),
//                   ),
//                   const SizedBox(height: 3),
//                   Text(
//                     item.description,
//                     style: TextStyle(
//                       color: Colors.white.withOpacity(0.7),
//                       fontSize: 10,
//                       height: 1.4,
//                     ),
//                     maxLines: 5,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ],
//               ),
//             );
//           }),
//         ),
//       );
//     });
//   }
// }