import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_invoice_qrcode_reader/core/dependency_registrar/feature_dependencies/history_dep.dart';
import 'package:e_invoice_qrcode_reader/data/repositories/object_box.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../network/connection_checker.dart';
import '../network/http_client.dart';
import 'feature_dependencies/home_dep.dart';

Future<void> initDependencies(GetIt sl) async {

  //#region Common Dependencies

  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  sl.registerLazySingleton<ConnectionChecker>(() => ConnectionCheckerImpl(
    connectivity: sl(),
  ));

  var sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton<HttpClient>(
        () => HttpClientImpl(
      sharedPreferences: sl(),
      connectionChecker: sl(),
    ),
  );
var objectBoxImpl = await ObjectBox.create();
  sl.registerLazySingleton<ObjectBox>(() => objectBoxImpl);

  //#endregion

  homeDependencies(sl);
  historyDependencies(sl);
}
