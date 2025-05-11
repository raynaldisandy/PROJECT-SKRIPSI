import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:skinalertsv2/Pages/home_view.dart';
import 'package:skinalertsv2/Pages/profile_view.dart';
import 'package:skinalertsv2/Routes/app_routes.dart';
import 'package:skinalertsv2/Utils/size_config.dart';
import 'package:skinalertsv2/Pages/login_view.dart';
import 'package:skinalertsv2/Pages/register_view.dart';
import 'package:skinalertsv2/splashscreen.dart';

/// Fungsi utama aplikasi Flutter.
Future<void> main() async {
  // Memastikan binding Flutter diinisialisasi.
  WidgetsFlutterBinding.ensureInitialized();

  // // Menginisialisasi Firebase.
  // await Firebase.initializeApp();

  // // Mengatur orientasi layar yang diinginkan.
  // await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);

  // Menjalankan aplikasi AutoBeres.
  runApp(const SkinAlerts());
}

class SkinAlerts extends StatelessWidget {
  const SkinAlerts({super.key});

  @override
  Widget build(BuildContext context) {
   

    // Menginisialisasi `SizeConfig` dengan konteks saat ini.
    SizeConfig().init(context);

    return GetMaterialApp(
      theme: ThemeData(useMaterial3: false),
      title: 'Skin Alert',
      debugShowCheckedModeBanner: false,

      // Membangun tata letak responsif berdasarkan breakpoint.
      builder: (BuildContext context, Widget? child) =>
          ResponsiveBreakpoints.builder(
        breakpoints: const <Breakpoint>[
          Breakpoint(start: 0, end: 480, name: MOBILE),
        ],
        child: child!,
      ),

      // Mengatur halaman awal aplikasi menjadi `AuthorizeView`.
      home: const ProfileView(),

      // Mengatur rute aplikasi menggunakan `AppRoutes.routes`.
      getPages: AppRoutes.routes,

      // Mengatur transisi default menjadi `Transition.noTransition`.
      defaultTransition: Transition.noTransition,
    );  
  }
}