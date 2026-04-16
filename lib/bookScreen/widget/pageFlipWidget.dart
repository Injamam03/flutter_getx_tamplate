
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/bookController.dart';
import '../model/bookPageModel.dart';

class PageFlipWidget extends StatefulWidget {
  const PageFlipWidget({super.key});

  @override
  State<PageFlipWidget> createState() => _PageFlipWidgetState();
}

class _PageFlipWidgetState extends State<PageFlipWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _flipAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _flipAnim = CurvedAnimation(
      parent: _ctrl,
      curve: Curves.easeInOutCubic,
    );

    final controller = Get.find<BookController>();

    // isFlipping change হলে animation শুরু হবে
    ever(controller.isFlipping, (bool flipping) {
      if (flipping) {
        _ctrl.forward(from: 0).then((_) {
          if (controller.isFlippingForward.value) {
            controller.goNextComplete();
          } else {
            controller.goPrevComplete();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BookController c = Get.find();
    final size = MediaQuery.of(context).size;

    return Obx(() {
      final currentIdx = c.currentIndex.value;
      final isFlipping = c.isFlipping.value;
      final isForward = c.isFlippingForward.value;

      final currentPage = c.pages[currentIdx];
      final nextPage = isForward && currentIdx < c.totalPages - 1
          ? c.pages[currentIdx + 1]
          : null;
      final prevPage = !isForward && currentIdx > 0
          ? c.pages[currentIdx - 1]
          : null;

      return GestureDetector(
        onHorizontalDragEnd: (details) {
          final velocity = details.primaryVelocity ?? 0;
          if (velocity < -300) {
            c.goNext(); // Right → Left = next page
          } else if (velocity > 300) {
            c.goPrev(); // Left → Right = prev page
          }
        },
        child: Stack(
          children: [
            // ─── 1. Background page (পরের বা আগের page) ───────
            if (isFlipping)
              Positioned.fill(
                child: _buildPageImage(
                  isForward ? nextPage : prevPage,
                  size,
                ),
              ),

            // ─── 2. Current page (flip হয়ে যাচ্ছে) ───────
            if (isFlipping)
              AnimatedBuilder(
                animation: _flipAnim,
                builder: (context, _) {
                  final angle = isForward
                      ? _flipAnim.value * pi        // 0 → π (right to left)
                      : ( _flipAnim.value) * pi; // π → 0 (left to right)

                  // π/2 এর পর পেছনের দিক দেখা যাবে
                  final showBack = isForward
                      ? _flipAnim.value > 0.5
                      : _flipAnim.value < 0.5;

                  return Transform(
                    alignment: isForward
                        ? Alignment.centerLeft   // বাম দিক থেকে flip
                        : Alignment.centerRight, // ডান দিক থেকে flip
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001) // perspective
                      ..rotateY(isForward ? -angle : angle),
                    child: showBack
                        ? _buildPageBack(size, isForward ? nextPage : currentPage)
                        : _buildPageImage(currentPage, size),
                  );
                },
              ),

            // ─── 3. Static page (animation নেই) ───────
            if (!isFlipping)
              Positioned.fill(
                child: _buildPageImage(currentPage, size),
              ),

            // ─── 4. Page counter ───────
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: _PageCounter(
                current: currentIdx + 1,
                total: c.totalPages,
              ),
            ),

            // ─── 5. Navigation arrows ───────
            Positioned(
              bottom: 16,
              left: 20,
              child: c.canGoPrev
                  ? GestureDetector(
                onTap: c.goPrev,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.45),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              )
                  : const SizedBox.shrink(),
            ),

            Positioned(
              bottom: 16,
              right: 20,
              child: c.canGoNext
                  ? GestureDetector(
                onTap: c.goNext,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.45),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                  child: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              )
                  : const SizedBox.shrink(),
            ),

            // ─── 6. Flip shadow/shimmer effect ───────
            if (isFlipping)
              AnimatedBuilder(
                animation: _flipAnim,
                builder: (context, _) {
                  final shadowOpacity = isForward
                      ? (0.5 - (_flipAnim.value - 0.5).abs()) * 0.6
                      : (0.5 - (_flipAnim.value - 0.5).abs()) * 0.6;

                  return Positioned.fill(
                    child: IgnorePointer(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: isForward
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            end: isForward
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            colors: [
                              Colors.black.withOpacity(
                                  shadowOpacity.clamp(0.0, 1.0)),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      );
    });
  }

  // ✅ Page image builder — local asset বা network url দুটোই handle করে
  Widget _buildPageImage(BookPage? page, Size size) {
    if (page == null) {
      return Container(color: Colors.black);
    }

    // Backend থেকে URL এলে NetworkImage use করবে
    if (page.imageUrl != null && page.imageUrl!.isNotEmpty) {
      return Image.network(
        page.imageUrl!,
        fit: BoxFit.cover,
        width: size.width,
        height: size.height,
        loadingBuilder: (_, child, progress) {
          if (progress == null) return child;
          return Container(
            color: Colors.black,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white54),
            ),
          );
        },
        errorBuilder: (_, __, ___) => _buildPlaceholder(size),
      );
    }

    // Local asset
    return Image.asset(
      page.imageAsset,
      fit: BoxFit.cover,
      width: size.width,
      height: size.height,
      errorBuilder: (_, __, ___) => _buildPlaceholder(size),
    );
  }

  // Page flip এর পেছনের দিক — হালকা shimmer/glossy effect
  Widget _buildPageBack(Size size, BookPage? nextPage) {
    return Stack(
      children: [
        _buildPageImage(nextPage, size),
        Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.white.withOpacity(0.15),
                Colors.white.withOpacity(0.05),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholder(Size size) {
    return Container(
      width: size.width,
      height: size.height,
      color: const Color(0xFF1A1A2E),
      child: const Center(
        child: Icon(Icons.image_not_supported, color: Colors.white24, size: 60),
      ),
    );
  }
}

// ✅ Page counter widget
class _PageCounter extends StatelessWidget {
  final int current;
  final int total;

  const _PageCounter({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.15)),
        ),
        child: Text(
          '$current / $total',
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}