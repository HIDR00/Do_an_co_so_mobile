import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

import '../../base/base_page_state.dart';
import '../../common_view/common_app_bar.dart';
import '../../common_view/common_scaffold.dart';
import '../../resource/dimens/dimens.dart';
import '../../resource/styles/app_colors.dart';
import '../../resource/styles/app_text_styles.dart';
import 'bloc/guest_order.dart';

@RoutePage()
class GuestOrderPage extends StatefulWidget {
  const GuestOrderPage({required this.tableId, super.key});
  final int tableId;
  @override
  State<GuestOrderPage> createState() => _GuestOrderPageState();
}

class _GuestOrderPageState extends BasePageState<GuestOrderPage, GuestOrderBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(GuestOrderPageInitiated(widget.tableId));
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocBuilder<GuestOrderBloc, GuestOrderState>(
      builder: (context, state) {
        return state.loder.orders.isNullOrEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CommonScaffold(
                appBar: CommonAppBar(
                  leadingIconColor: AppColors.genericBlack,
                ),
                body: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryBG,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: Dimens.d20, right: Dimens.d20, top: Dimens.d45, bottom: Dimens.d45),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(Dimens.d30))),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(
                              height: Dimens.d20,
                            ),
                            Text(
                              'Guest Order',
                              style: AppTextStyles.s20w700Title2().copyWith(color: AppColors.current.baseColors3),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.current.baseColors1),
                                    borderRadius: const BorderRadius.all(Radius.circular(Dimens.d30))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Table',
                                          style: AppTextStyles.s14w600Primary()
                                              .copyWith(color: AppColors.current.baseColors1),
                                        ),
                                        Text(
                                          widget.tableId.toString(),
                                          style: AppTextStyles.s14w600Primary()
                                              .copyWith(color: AppColors.current.baseColors1),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Date',
                                          style: AppTextStyles.s14w600Primary()
                                              .copyWith(color: AppColors.current.baseColors1),
                                        ),
                                        Text(
                                          '${DateTime.now().month.toString()}/${DateTime.now().day.toString()}/${DateTime.now().year.toString()}',
                                          style: AppTextStyles.s14w600Primary()
                                              .copyWith(color: AppColors.current.baseColors1),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Time',
                                          style: AppTextStyles.s14w600Primary()
                                              .copyWith(color: AppColors.current.baseColors1),
                                        ),
                                        Text(
                                          '${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}:${DateTime.now().day.toString()}',
                                          style: AppTextStyles.s14w600Primary()
                                              .copyWith(color: AppColors.current.baseColors1),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(30, (index) {
                                        return Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 5.0 / 2),
                                          width: 2 * 2,
                                          height: 2 * 2,
                                          decoration: const BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle,
                                          ),
                                        );
                                      }),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'Item',
                                      style:
                                          AppTextStyles.s16w600Primary().copyWith(color: AppColors.current.baseColors1),
                                    ),
                                    const SizedBox(height: 20),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: state.loder.orders.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                state.loder.orders[index].menu.name,
                                                style: AppTextStyles.s14w400Description()
                                                    .copyWith(color: AppColors.current.baseColors1),
                                              ),
                                              Text(
                                                'x${state.loder.orders[index].quantity}',
                                                style: AppTextStyles.s14w600Primary()
                                                    .copyWith(color: AppColors.current.baseColors1),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: _renderButton(state),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget _renderButton(GuestOrderState state) {
    return GestureDetector(
      onTap: () {
        bloc.add(GuestOrderPageFreeTable(widget.tableId));
      },
      child: Container(
        height: Dimens.d50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.current.baseColors4,
            borderRadius: BorderRadius.circular(Dimens.d10),
            border: Border.all(color: AppColors.current.baseColors4)),
        child: Center(child: Text(GetStatus(state) ?? '', style: AppTextStyles.s20w700Title2().copyWith(color: Colors.white))),
      ),
    );
  }

  String? GetStatus(GuestOrderState state) {
    String? result;
    if (state.status == 1) {
      result = 'Received Order';
    } else if (state.status == 2) {
      result = 'Serving';
    } else if (state.status == 3) {
      result = 'Done';
    }
    return result;
  }
}
