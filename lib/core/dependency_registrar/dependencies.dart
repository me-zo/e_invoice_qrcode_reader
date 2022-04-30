import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:e_invoice_qrcode_reader/core/dependency_registrar/feature_dependencies/actions_dep.dart';
import 'package:e_invoice_qrcode_reader/core/dependency_registrar/feature_dependencies/history_dep.dart';
import 'package:e_invoice_qrcode_reader/core/dependency_registrar/feature_dependencies/home_dep.dart';
import 'package:e_invoice_qrcode_reader/data/repositories/invoice/invoice_repository.dart';
import 'package:e_invoice_qrcode_reader/data/repositories/invoice/invoice_repository_impl.dart';
import 'package:e_invoice_qrcode_reader/data/shared_preferences/settings_notifier.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class Dependencies {
  static Future<void> init() async {
    //#region Common Dependencies

    sl.registerLazySingleton<Connectivity>(() => Connectivity());

    var sharedPreferences = await SharedPreferences.getInstance();

    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    var objectBoxImpl = await InvoiceRepositoryImpl.create();
    sl.registerSingleton<InvoiceRepository>(objectBoxImpl);

    sl.registerLazySingleton<SettingsNotifier>(() => SettingsNotifier());

    //#endregion

    homeDependencies(sl);
    historyDependencies(sl);
    actionDependencies(sl);
  }
}
