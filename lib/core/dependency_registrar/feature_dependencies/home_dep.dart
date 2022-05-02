import 'package:get_it/get_it.dart';

import '../../../../features/home/domain/service/home_service.dart';
import '../../../../features/home/domain/service/home_service_impl.dart';
import '../../../../features/home/presentation/manager/home_cubit.dart';

void homeDependencies(GetIt locator) {
  locator.registerFactory<HomeService>(
    () => HomeServiceImpl(
      invoiceRepository: locator(),
    ),
  );

  locator.registerSingleton<HomeCubit>(
    HomeCubit(
      homeService: locator(),
    ),
  );
}
