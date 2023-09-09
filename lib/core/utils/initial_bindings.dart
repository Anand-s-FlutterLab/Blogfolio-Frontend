// Import the necessary packages and classes.
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_frontend/core/app_export.dart';
import 'package:flutter_frontend/core/network/network_info.dart';
import 'package:flutter_frontend/core/utils/initial_data_load.dart';

// Create a bindings class for initial dependencies.
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Inject ConnectivityController as a dependency.
    Get.put(ConnectivityController());

    // Inject InitialDataLoad as a dependency.
    Get.put(InitialDataLoad());
  }
}
