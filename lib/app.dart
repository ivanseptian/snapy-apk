import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:markaz_snappy/config/config.dart';
import 'package:markaz_snappy/routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return GetMaterialApp(
          getPages: routes,
          debugShowCheckedModeBanner: true,
          title: StringValue.appTitle,
          theme: appTheme,
          initialRoute: Routes.root,
        );
      },
    );
  }

}
  