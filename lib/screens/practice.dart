import 'package:flutter/material.dart';
import 'package:flutter_getx_tamplete/screens/controller/Theatre_Controller.dart';
import 'package:get/get.dart';
import 'model/theatre_model.dart';

class TheatreScreen extends StatelessWidget {
  const TheatreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TheatreController());
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // ── 1. Background image ──
          Image.asset(
            'assets/images/background_img.png',
            fit: BoxFit.cover,
          ),

          // ── 3. Content ──
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _AppBarWidget(),
                const SizedBox(height: 16),
                _CategoryTabsWidget(),
                const SizedBox(height: 24),
                Expanded(
                  child: _BooksSection(screenWidth: screenWidth),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// AppBar
// ─────────────────────────────────────────
class _AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.arrow_back_ios_new,
                  color: Colors.white, size: 17),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Theatre',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 34),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// Category Tabs

class _CategoryTabsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TheatreController c = Get.find();
    return SizedBox(
      height: 36,
      child: Obx(() => ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: c.categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          final selected = c.selectedCategoryIndex.value == i;
          return GestureDetector(
            onTap: () => c.selectCategory(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(
                  horizontal: 18, vertical: 7),
              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xFFF5A623)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selected
                      ? const Color(0xFFF5A623)
                      : Colors.white.withAlpha(80),
                  width: 1.2,
                ),
              ),
              child: Text(
                c.categories[i].name,
                style: TextStyle(
                  color: selected ? Colors.black87 : Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}

// ─────────────────────────────────────────
// Books Section
// ─────────────────────────────────────────
class _BooksSection extends StatelessWidget {
  final double screenWidth;
  const _BooksSection({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final TheatreController c = Get.find();

    // Card sizes — left smallest, right largest
    final double w0 = screenWidth * 0.30;
    final double w1 = screenWidth * 0.30;
    final double w2 = screenWidth * 0.30;

    final double h0 = w0 * 2;
    final double h1 = w1 * 2;
    final double h2 = w2 * 2;

    // Horizontal positions
    final double x0 = screenWidth * 0.02;
    final double x1 = screenWidth * 0.35;
    final double x2 = screenWidth * 0.67;

    // Vertical: left card lowest, right card highest (staircase going up-right)
    // All cards bottom edges are staggered
    final double totalHeight = h2 + 40;
    final double y2 = 40.0;                          // right: near top
    final double y1 = 145 ;        // middle: a bit lower
    final double y0 =250;               // left: lowest


    // Info tile height area
    const double infoAreaHeight = 120.0;

    return Obx(() {
      final items = c.items;
      if (items.isEmpty) return const SizedBox();

      return SingleChildScrollView(
        child: Column(
          children: [
            // Cards stack
            SizedBox(
              width: screenWidth,
              height: totalHeight,
              child: Stack(
                clipBehavior: Clip.none,
                children: [

                  // Left card (smallest, lowest)
                  Positioned(
                    left: x0,
                    top: y0,
                    child: _BookCard(
                        item: items[0], width: w0, height: h0),
                  ),

                  // Middle card
                  Positioned(
                    left: x1,
                    top: y1,
                    child: _BookCard(
                        item: items[1], width: w1, height: h1),
                  ),

                  // Right card (largest, highest)
                  Positioned(
                    left: x2,
                    top: y2,
                    child: _BookCard(
                        item: items[2], width: w2, height: h2),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 6),
            SizedBox(
              width: screenWidth,
              height: infoAreaHeight +280,
              child: Stack(
                children: [
                  // Left info tile (lowest = most padding top)
                  Positioned(
                    left: 40,
                    top: 270,
                    width: w1 - 4,
                    child: _InfoTile(item: items[0]),
                  ),
                  // Middle info tile
                  Positioned(
                    left: 180,
                    top: 165,
                    width: w1 - 4,
                    child: _InfoTile(item: items[1]),
                  ),
                  // Right info tile (highest = least padding top)
                  Positioned(
                    left: 310,
                    top: 70,
                    width: w2,
                    child: _InfoTile(item: items[2]),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

// Book Card
// ───────────────────────────────────
class _BookCard extends StatelessWidget {
  final TheatreItem item;
  final double width;
  final double height;

  const _BookCard(
      {required this.item, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFF5A623), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFF5A623).withAlpha(55),
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(
          item.imageAsset,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => Container(
            color: const Color(0xFF1A2A3A),
            child: const Center(
              child: Icon(Icons.image, color: Colors.white24, size: 32),
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// Info Tile
// ─────────────────────────────────────────
class _InfoTile extends StatelessWidget {
  final TheatreItem item;
  const _InfoTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [

        const SizedBox(height: 4),
        Text(
          item.title,
          style: const TextStyle(
            color: Color(0xFFF5A623),
            fontWeight: FontWeight.bold,
            fontSize: 11.5,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          item.description,
          style: TextStyle(
            color: Colors.white.withAlpha(150),
            fontSize: 10,
            height: 1.4,
          ),
          maxLines: 6,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

