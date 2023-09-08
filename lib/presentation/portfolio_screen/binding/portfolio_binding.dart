import 'package:flutter_frontend/presentation/portfolio_screen/controller/portfolio_controller.dart';
import 'package:flutter_frontend/core/app_export.dart';

class PortfolioBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PortfolioController());
  }
}
