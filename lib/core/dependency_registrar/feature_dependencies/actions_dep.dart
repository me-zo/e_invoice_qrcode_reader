import '../../../features/actions/domain/service/actions_service.dart';
import '../../../features/actions/domain/service/actions_service_impl.dart';
import '../../../features/actions/presentation/manager/actions_cubit.dart';
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
