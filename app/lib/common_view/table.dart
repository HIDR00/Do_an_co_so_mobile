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
              color: AppColors.current.baseColors2,
              borderRadius: BorderRadius.circular(Dimens.d12),
              border: getBorder(),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ]),
          child: _renderImageTable(),
        ),
      ),
    );
  }

  Widget _renderImageTable() {
    return Stack(children: [
      SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ClipRRect(
          borderRadius:
              const BorderRadius.all(Radius.circular(Dimens.d12)),
          child: Assets.images.tableImg.image(height: Dimens.d50, fit: BoxFit.fill),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: Dimens.d110,left: Dimens.d10),
        child: Text('Bàn ${index + 1}', style: AppTextStyles.s18w700Title2(color: AppColors.primaryBG))),
    ]);
  }

  BoxBorder? getBorder() {
    Border? border;
    if (lTable[index].status == 1) {
      border = Border.all(color: AppColors.current.borderTable, width: Dimens.d3);
    } else if (lTable[index].status == 2) {
      border = Border.all(color: AppColors.current.baseColors3, width: Dimens.d3);
    } else if (lTable[index].status == 3) {
      border = Border.all(color: Colors.green, width: Dimens.d3);
    }
    return border;
  }
}
