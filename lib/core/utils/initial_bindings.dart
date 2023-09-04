import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/core/network/network_info.dart';
import 'package:flutter_frontend/core/utils/initial_data_load.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ConnectivityController());
    Get.put(InitialDataLoad());
  }
}
