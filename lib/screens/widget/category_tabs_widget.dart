import 'package:flutter/material.dart';
import 'package:flutter_getx_tamplete/screens/controller/Theatre_Controller.dart';
import 'package:get/get.dart';

class CategoryTabsWidget extends StatelessWidget {
  const CategoryTabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TheatreController controller = Get.find<TheatreController>();

    return SizedBox(
      height: 36,
      child: Obx(
            () => ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: controller.categories.length,
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            final isSelected =
                controller.selectedCategoryIndex.value == index;
            return GestureDetector(
              onTap: () => controller.selectCategory(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFFF5A623)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xFFF5A623)
                        : Colors.white.withOpacity(0.35),
                    width: 1.2,
                  ),
                ),
                child: Text(
                  controller.categories[index].name,
                  style: TextStyle(
                    color: isSelected ? Colors.black87 : Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}