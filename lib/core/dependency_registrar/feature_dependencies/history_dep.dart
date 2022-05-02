import '../../../features/history/domain/service/history_service.dart';
import '../../../features/history/domain/service/history_service_impl.dart';
import '../../../features/history/presentation/manager/history_cubit.dart';
import 'package:get_it/get_it.dart';

void historyDependencies(GetIt locator) {
  locator.registerFactory<HistoryService>(
    () => HistoryServiceImpl(
      invoiceRepository: locator(),
    ),
  );

  locator.registerSingleton<HistoryCubit>(
    HistoryCubit(
      historyService: locator(),
    ),
  );
}
