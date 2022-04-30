import 'package:e_invoice_qrcode_reader/presentation/actions/domain/service/actions_service.dart';
import 'package:e_invoice_qrcode_reader/presentation/actions/domain/service/actions_service_impl.dart';
import 'package:e_invoice_qrcode_reader/presentation/actions/presentation/manager/actions_cubit.dart';
import 'package:get_it/get_it.dart';

Future<void> actionDependencies(GetIt sl) async {
  sl.registerFactory<ActionsService>(
    () => ActionsServiceImpl(
      settingsNotifier: sl(),
    ),
  );

  sl.registerSingleton<ActionsCubit>(
    ActionsCubit(
      actionsService: sl(),
    ),
  );
}
