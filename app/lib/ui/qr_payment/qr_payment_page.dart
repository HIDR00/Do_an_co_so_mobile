import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  
import '../../app.dart';
import 'bloc/qr_payment.dart';
  
@RoutePage()
class QrPaymentPage extends StatefulWidget {
  const QrPaymentPage({required this.amount, super.key});
  final int amount;
  
  @override
  State<StatefulWidget> createState() {
    return _QrPaymentPageState();
  }
}

class _QrPaymentPageState extends BasePageState<QrPaymentPage, QrPaymentBloc> {
  @override
  void initState() {
    super.initState();
    bloc.add(QrPaymentPageInitiated(widget.amount));
  }

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: BlocBuilder<QrPaymentBloc, QrPaymentState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return  const Scaffold(
              
            );
          },
        ),
      ),
    );
  }
}
