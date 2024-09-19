import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../resource/dimens/dimens.dart';
import '../resource/generated/assets.gen.dart';
import '../resource/styles/app_colors.dart';
import '../resource/styles/app_text_styles.dart';

// ignore: must_be_immutable
class TableCommon extends StatelessWidget {
  TableCommon({required this.index, required this.lTable, super.key, this.ontap});
  final int index;
  final List<MTable> lTable;
  void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Dimens.d30),
            border: lTable[index].status != 0
                ? Border.all(color: AppColors.current.borderTable, width: Dimens.d2)
                : null,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2), 
              ),
            ],
          ),
          child: Stack(children: [
            Center(child: Text('Bàn số ${index + 1}', style: AppTextStyles.s18w700Title2())),
            Center(child: Image.asset(Assets.images.table.path))
          ]),
        ),
      ),
    );;
  }
}