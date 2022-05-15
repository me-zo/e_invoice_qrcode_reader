import 'package:get_it/get_it.dart';

import '../../../features/history/domain/service/history_service.dart';
import '../../../features/history/domain/service/history_service_impl.dart';
import '../../../features/history/presentation/manager/history_cubit.dart';

void historyDependencies(GetIt locator) {
  locator.registerFactory<HistoryService>(() => HistoryServiceImpl());

  locator.registerSingleton<HistoryCubit>(HistoryCubit());
}
