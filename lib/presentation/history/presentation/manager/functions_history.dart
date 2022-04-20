import 'history_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin FunctionsHistory {
  void validateQrCode(BuildContext context, String scannedString) {
    BlocProvider.of<HistoryCubit>(context)
        .validateQrCode(scannedString: scannedString);
  }
}
