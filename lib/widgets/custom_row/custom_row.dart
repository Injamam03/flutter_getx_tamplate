import 'package:flutter/cupertino.dart';
import 'package:flutter_getx_tamplete/constant/app_colors.dart';
import 'package:flutter_getx_tamplete/constant/app_const_string.dart';
import 'package:flutter_getx_tamplete/utils/app_size.dart';

class CustomRow extends StatefulWidget {
  final Color? selectedColor;
  final Color? selectedTextColor;
  final Color? selectedBorderColor;
  final String leftText;
  final String rightText;
  final double buttonHeight;
  final double buttonWidth;
  final void Function()? ontapLeft;
  final void Function()? ontapRight;

  const CustomRow({
    super.key,
    this.selectedColor,
    this.selectedTextColor,
    this.selectedBorderColor,
    this.leftText = ConstString.demoText,
    this.rightText = ConstString.demoText,
    this.buttonHeight = 50,
    this.buttonWidth = 150,
    this.ontapLeft,
    this.ontapRight,
  });

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildOption(
          text: widget.leftText,
          index: 0,
          isSelected: selectedIndex == 0,
          ontap: () {
            print("ontap left");
            if (widget.ontapLeft != null) widget.ontapLeft!();
          },
        ),

        _buildOption(
          text: widget.rightText,
          index: 1,
          isSelected: selectedIndex == 1,
          ontap: () {
            print("ontap right");
            if (widget.ontapRight != null) widget.ontapRight!();
          },
        ),
      ],
    );
  }

  Widget _buildOption({
    required String text,
    required int index,
    required bool isSelected,
    required void Function() ontap,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        ontap();
      },
      child: Container(
        height: AppSize.height(value: widget.buttonHeight),
        width: AppSize.width(value: widget.buttonWidth),
        decoration: BoxDecoration(
          color:
              isSelected ? (widget.selectedColor ?? ConstColor.blue200) : null,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          border:
              isSelected
                  ? (widget.selectedBorderColor != null
                      ? Border.all(color: widget.selectedBorderColor!)
                      : Border.all(color: ConstColor.customerPrimaryColor))
                  : Border.all(color: ConstColor.grey400),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: AppSize.height(value: 16),
              fontWeight: FontWeight.w500,
              fontFamily: "SFPro",
              color: isSelected ? (widget.selectedTextColor) : null,
            ),
          ),
        ),
      ),
    );
  }
}
