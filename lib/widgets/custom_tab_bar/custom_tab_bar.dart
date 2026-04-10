import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final List<Widget> contents;

  const CustomTabBar({
    super.key,
    this.contents = const [],
  });

  @override
  State<CustomTabBar> createState() => _CustomTabScreenState();
}

class _CustomTabScreenState extends State<CustomTabBar> {
  int selectedIndex = 0;

  final List<String> tabTitles = ["Processed", "Complete"]; // ⬅ Return removed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(14),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(tabTitles.length, (index) {
                bool isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xff0036AE) : const Color(0xFFF2F2F7),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      tabTitles[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : const Color(0xff0036AE).withOpacity(0.7),
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: widget.contents.isNotEmpty
                ? widget.contents[selectedIndex]
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}