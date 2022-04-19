import 'package:get_it/get_it.dart';

import '../../../../presentation/home/domain/service/home_service.dart';
import '../../../../presentation/home/domain/service/home_service_impl.dart';
import '../../../../presentation/home/presentation/manager/home_cubit.dart';

Future<void> homeDependencies(GetIt sl) async {

  sl.registerFactory<HomeService>(
        () => HomeServiceImpl(
    ),
  );

  sl.registerFactory(
        () => HomeCubit(
          homeService: sl(),
        ),
  );
}
