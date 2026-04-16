import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/Theatre_Controller.dart';
import 'bookCard.dart';
import 'infoTile.dart';

class DiagonalBooksSection extends StatefulWidget {
  const DiagonalBooksSection({super.key});

  @override
  State<DiagonalBooksSection> createState() => _DiagonalBooksSectionState();
}

class _DiagonalBooksSectionState extends State<DiagonalBooksSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  // slot positions: 0=bottom-left, 1=middle, 2=top-right
  // incoming থেকে slot 0,1,2 এ যাবে
  // outgoing slot 0,1,2 থেকে বেরিয়ে যাবে

  int _direction = 0; // +1 swipe left, -1 swipe right
  bool _isAnimating = false;

  // আগের items (animation এর সময় দেখাবো)
  List<String> _prevKeys = [];
  List<String> _currKeys = [];

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOutCubic);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _swipe(int dir, VoidCallback onMidpoint) {
    if (_isAnimating) return;
    final c = Get.find<TheatreController>();
    _prevKeys = [c.leftItem.title, c.middleItem.title, c.rightItem.title];
    _direction = dir;
    _isAnimating = true;

    _ctrl.forward(from: 0).then((_) {
      onMidpoint();
      _currKeys = [c.leftItem.title, c.middleItem.title, c.rightItem.title];
      _ctrl.reset();
      setState(() => _isAnimating = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TheatreController c = Get.find();
    final screenWidth = MediaQuery.of(context).size.width;

    final double w = screenWidth * 0.30;
    final double h = w * 2.15;
    final double totalHeight = h + 300;

    // ✅ 3টা fixed slot position
    final slots = [
      Offset(screenWidth * 0.02, 260),  // slot 0: bottom-left
      Offset(screenWidth * 0.35, 145), // slot 1: middle
      Offset(screenWidth * 0.67, 40),  // slot 2: top-right
    ];

    // Screen এর বাইরে — নতুন card আসবে এখান থেকে / যাবে এখানে
    // Swipe left: নতুন card আসে top-right এর বাইরে থেকে
    //             পুরনো card যায় bottom-left এর বাইরে দিয়ে
    final Offset enterFrom = _direction >= 0
        ? Offset(screenWidth * 1.1, -h * 0.5)   // right-top এর বাইরে
        : Offset(-w * 1.2, h * 1.2);             // left-bottom এর বাইরে

    final Offset exitTo = _direction >= 0
        ? Offset(-w * 1.2, h * 1.2)              // left-bottom এর বাইরে
        : Offset(screenWidth * 1.1, -h * 0.5);   // right-top এর বাইরে

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (_isAnimating) return;
        if ((details.primaryVelocity ?? 0) < -200) {
          _swipe(1, () => c.onSwipeLeft());
        } else if ((details.primaryVelocity ?? 0) > 200) {
          _swipe(-1, () => c.onSwipePrev());
        }
      },
      child: Obx(() {
        final items = [c.leftItem, c.middleItem, c.rightItem];

        return AnimatedBuilder(
          animation: _anim,
          builder: (context, _) {
            final t = _anim.value; // 0 → 1

            return SizedBox(
              width: screenWidth,
              height: totalHeight,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  //  3টা current card — slot position এ আছে
                  // animation চলার সময় exit করবে
                  ...List.generate(3, (i) {
                    // current position: slot[i] → exitTo (t=0 থেকে t=1)
                    final double left = _isAnimating
                        ? slots[i].dx + (exitTo.dx - slots[i].dx) * t
                        : slots[i].dx;
                    final double top = _isAnimating
                        ? slots[i].dy + (exitTo.dy - slots[i].dy) * t
                        : slots[i].dy;
                    final double opacity = _isAnimating ? (1 - t).clamp(0, 1) : 1.0;

                    return Positioned(
                      left: left,
                      top: top,
                      child: Opacity(
                        opacity: opacity,
                        child: BookCard(
                          key: ValueKey('curr_${items[i].title}'),
                          item: items[i],
                          width: w,
                          height: h,
                          onTap: () => c.onItemTap(items[i]),
                        ),
                      ),
                    );
                  }),

                  // Incoming 3 cards — enterFrom থেকে slot এ আসবে
                  if (_isAnimating)
                    ...List.generate(3, (i) {
                      final double left =
                          enterFrom.dx + (slots[i].dx - enterFrom.dx) * t;
                      final double top =
                          enterFrom.dy + (slots[i].dy - enterFrom.dy) * t;
                      final double opacity = t.clamp(0, 1);

                      // next items
                      final TheatreController cc = Get.find();
                      final nextItems = [cc.leftItem, cc.middleItem, cc.rightItem];

                      return Positioned(
                        left: left,
                        top: top,
                        child: Opacity(
                          opacity: opacity,
                          child: BookCard(
                            key: ValueKey('next_${nextItems[i].title}_$i'),
                            item: nextItems[i],
                            width: w,
                            height: h,
                            onTap: () {},
                          ),
                        ),
                      );
                    }),

                  //  Info tiles
                  ...List.generate(3, (i) {
                    final infoOffsets = [
                      Offset(50, 330 + h),
                      Offset(190, 225 + h),
                      Offset(320, 120 + h),
                    ];
                    final double left = _isAnimating
                        ? infoOffsets[i].dx + (exitTo.dx - slots[i].dx) * t * 0.3
                        : infoOffsets[i].dx;
                    final double top = _isAnimating
                        ? infoOffsets[i].dy + (exitTo.dy - slots[i].dy) * t * 0.3
                        : infoOffsets[i].dy;
                    final opacity = _isAnimating ? (1 - t * 2).clamp(0.0, 1.0) : 1.0;

                    return Positioned(
                      left: left,
                      top: top,
                      width: w - 4,
                      child: Opacity(
                        opacity: opacity,
                        child: InfoTile(
                          key: ValueKey('info_${items[i].title}'),
                          item: items[i],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}