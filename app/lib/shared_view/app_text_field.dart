import 'package:flutter/material.dart';

import '../app.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.title,
    this.hintText = '',
    this.suffixIcon,
    this.controller,
    this.onChanged,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    super.key,
  });

  final String title;
  final String hintText;
  final SvgGenImage? suffixIcon;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: AppTextStyles.s16w600Primary().copyWith(color: AppColors.current.baseColors4),
          ),
        ),
        SizedBox(height: Dimens.d8.responsive()),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Màu bóng và độ trong suốt
                spreadRadius: 1, // Độ rộng của vùng bóng đổ xung quanh
                blurRadius: 3, // Độ mờ của bóng đổ
                offset: const Offset(0, 2), // Thay đổi vị trí bóng đổ
              ),
            ],
          ),
          child: TextField(
            onTap: onTap,
            onChanged: onChanged,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}
