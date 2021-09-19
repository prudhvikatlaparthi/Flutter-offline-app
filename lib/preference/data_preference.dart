import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DataPreferences extends GetxController {
  final String _kIsAppLaunched = "kIsAppLaunched";

  _savePreference(String key, dynamic value) {
    GetStorage().write(key, value);
  }

  T? _readPreference<T>(String key) {
    return GetStorage().read<T?>(key);
  }

  deletePreferences() {
    GetStorage().erase();
  }

  setIsAppLaunched(bool value) {
    _savePreference(_kIsAppLaunched, value);
  }

  bool getIsAppLaunched() {
    return _readPreference<bool>(_kIsAppLaunched) ?? false;
  }
}
