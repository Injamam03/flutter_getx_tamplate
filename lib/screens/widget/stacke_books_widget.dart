// import 'package:flutter/material.dart';
// import 'package:flutter_getx_tamplete/screens/controller/Theatre_Controller.dart';
// import 'package:flutter_getx_tamplete/screens/model/theatre_model.dart';
// import 'package:get/get.dart';
// class StackedBooksWidget extends StatelessWidget {
//   const StackedBooksWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final TheatreController controller = Get.find<TheatreController>();
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return Obx(() {
//       final items = controller.items;
//       if (items.isEmpty) return const SizedBox();
//
//       // Card dimensions - left smallest, middle medium, right largest
//       final List<double> cardWidths = [
//         screenWidth * 0.28,
//         screenWidth * 0.33,
//         screenWidth * 0.38,
//       ];
//       final List<double> cardHeights = [
//         cardWidths[0] * 1.55,
//         cardWidths[1] * 1.55,
//         cardWidths[2] * 1.55,
//       ];
//
//       // How much the section takes in height
//       final double sectionHeight = cardHeights[2] + 60;
//
//       // Left positions for cards
//       final double leftCard = screenWidth * 0.01;
//       final double midCard = screenWidth * 0.28;
//       final double rightCard = screenWidth * 0.55;
//
//       // Bottom alignment — all cards sit at same bottom line
//       final double bottomBase = 0;
//
//       return SizedBox(
//         height: sectionHeight,
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             // ── Diagonal golden dotted connector lines ──
//             Positioned.fill(
//               child: CustomPaint(
//                 painter: _DiagonalLinePainter(
//                   cardWidths: cardWidths,
//                   cardHeights: cardHeights,
//                   leftCard: leftCard,
//                   midCard: midCard,
//                   rightCard: rightCard,
//                   sectionHeight: sectionHeight,
//                 ),
//               ),
//             ),
//
//             // ── Left card (smallest) ──
//             Positioned(
//               left: leftCard,
//               bottom: bottomBase,
//               child: _BookCard(
//                 item: items[0],
//                 width: cardWidths[0],
//                 height: cardHeights[0],
//               ),
//             ),
//
//             // ── Middle card ──
//             Positioned(
//               left: midCard,
//               bottom: bottomBase,
//               child: _BookCard(
//                 item: items[1],
//                 width: cardWidths[1],
//                 height: cardHeights[1],
//               ),
//             ),
//
//             // ── Right card (largest) ──
//             Positioned(
//               left: rightCard,
//               bottom: bottomBase,
//               child: _BookCard(
//                 item: items[2],
//                 width: cardWidths[2],
//                 height: cardHeights[2],
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
//
// // ── Single book card ──
// class _BookCard extends StatelessWidget {
//   final TheatreItem item;
//   final double width;
//   final double height;
//
//   const _BookCard({
//     required this.item,
//     required this.width,
//     required this.height,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: const Color(0xFFF5A623), width: 2),
//         boxShadow: [
//           BoxShadow(
//             color: const Color(0xFFF5A623).withOpacity(0.25),
//             blurRadius: 10,
//             spreadRadius: 1,
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(6),
//         child: Image.asset(
//           item.imageAsset,
//           fit: BoxFit.cover,
//           errorBuilder: (_, __, ___) => Container(
//             color: const Color(0xFF1A2A3A),
//             child: const Center(
//               child: Icon(Icons.image, color: Colors.white24, size: 32),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // ── Info tile below each card ──
// class _InfoTile extends StatelessWidget {
//   final TheatreItem item;
//
//   const _InfoTile({required this.item});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Golden dot
//         Container(
//           width: 9,
//           height: 9,
//           decoration: const BoxDecoration(
//             color: Color(0xFFF5A623),
//             shape: BoxShape.circle,
//           ),
//         ),
//         const SizedBox(height: 5),
//         Text(
//           item.title,
//           style: const TextStyle(
//             color: Color(0xFFF5A623),
//             fontWeight: FontWeight.bold,
//             fontSize: 12,
//           ),
//         ),
//         const SizedBox(height: 3),
//         Text(
//           item.description,
//           style: TextStyle(
//             color: Colors.white.withOpacity(0.7),
//             fontSize: 10.5,
//             height: 1.4,
//           ),
//           maxLines: 4,
//           overflow: TextOverflow.ellipsis,
//         ),
//       ],
//     );
//   }
// }
//
// // ── Custom painter for diagonal dotted lines ──
// class _DiagonalLinePainter extends CustomPainter {
//   final List<double> cardWidths;
//   final List<double> cardHeights;
//   final double leftCard;
//   final double midCard;
//   final double rightCard;
//   final double sectionHeight;
//
//   _DiagonalLinePainter({
//     required this.cardWidths,
//     required this.cardHeights,
//     required this.leftCard,
//     required this.midCard,
//     required this.rightCard,
//     required this.sectionHeight,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = const Color(0xFFF5A623)
//       ..strokeWidth = 1.5
//       ..style = PaintingStyle.stroke;
//
//     // Dot paint
//     final dotPaint = Paint()
//       ..color = const Color(0xFFF5A623)
//       ..style = PaintingStyle.fill;
//
//     // Bottom of each card (y positions from top of stack widget)
//     final double leftBottom = sectionHeight - 0;
//     final double midBottom = sectionHeight - 0;
//     final double rightBottom = sectionHeight - 0;
//
//     // Center x of each card
//     final double leftCenterX = leftCard + cardWidths[0] / 2;
//     final double midCenterX = midCard + cardWidths[1] / 2;
//     final double rightCenterX = rightCard + cardWidths[2] / 2;
//
//     // Draw diagonal line from left to mid
//     _drawDottedLine(
//       canvas,
//       paint,
//       Offset(leftCenterX, leftBottom + 10),
//       Offset(midCenterX, midBottom + 10),
//     );
//
//     // Draw diagonal line from mid to right
//     _drawDottedLine(
//       canvas,
//       paint,
//       Offset(midCenterX, midBottom + 10),
//       Offset(rightCenterX, rightBottom + 10),
//     );
//
//     // Draw dots at card bottoms
//     canvas.drawCircle(Offset(leftCenterX, leftBottom + 10), 4, dotPaint);
//     canvas.drawCircle(Offset(midCenterX, midBottom + 10), 4, dotPaint);
//     canvas.drawCircle(Offset(rightCenterX, rightBottom + 10), 4, dotPaint);
//   }
//
//   void _drawDottedLine(Canvas canvas, Paint paint, Offset start, Offset end) {
//     const double dashWidth = 5;
//     const double dashSpace = 4;
//     final double totalLength =
//         (end - start).distance;
//     double drawn = 0;
//     final direction = (end - start) / totalLength;
//
//     while (drawn < totalLength) {
//       final s = start + direction * drawn;
//       final e = start + direction * (drawn + dashWidth).clamp(0, totalLength);
//       canvas.drawLine(s, e, paint);
//       drawn += dashWidth + dashSpace;
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }