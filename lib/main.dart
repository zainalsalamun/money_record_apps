import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:record_money_apps/config/app_color.dart';
import 'package:record_money_apps/config/session.dart';
import 'package:record_money_apps/presentation/page/auth/login_page.dart';
import 'package:record_money_apps/presentation/page/home_page.dart';

import 'data/model/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('id_ID').then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColor.primary,
            secondary: AppColor.secondary,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.primary,
            foregroundColor: Colors.white,
          )),
      home: FutureBuilder(
          future: Session.getUser(),
          builder: (context, AsyncSnapshot<User> snapshot) {
            if (snapshot.data != null && snapshot.data!.idUser != null) {
              return HomePage();
            }
            return const LoginPage();
          }),
    );
  }
}
