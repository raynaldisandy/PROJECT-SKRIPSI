import 'package:get/get.dart';
import 'package:skinalertsv2/Pages/login_view.dart';
import 'package:skinalertsv2/splashscreen.dart';
import 'routes_name.dart';

class AppRoutes {
  AppRoutes._();

  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<dynamic>(
        name: RoutesName.splashscreenRoute,
        page: () => const Splashscreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000)),
    // GetPage<dynamic>(
    //     name: RoutesName.frameRoute,
    //     page: () => const FrameView(),
    //     transition: Transition.fadeIn,
    //     transitionDuration: const Duration(milliseconds: 1000)),
    GetPage<dynamic>(
        name: RoutesName.loginRoute,
        page: () => const LoginView(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000)),
  ];
}