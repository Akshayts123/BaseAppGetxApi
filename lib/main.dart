
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:getx_base_app/routes.dart';
import 'core/config/colors.dart';
import 'core/config/text_styles.dart';
import 'core/utils/app_context.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ContextManager.setContext(context);
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) {
        return GetMaterialApp.router(
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
              routerDelegate:router.routerDelegate,
              debugShowCheckedModeBanner: kDebugMode,
              theme: ThemeData(
                fontFamily: 'Poppins',
                textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Poppins'),
                appBarTheme: const AppBarTheme(
                  scrolledUnderElevation: 0,
                  surfaceTintColor: Colors.white,
                ),
                scaffoldBackgroundColor: Colors.white,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                dialogBackgroundColor: Colors.white,
                bottomSheetTheme: const BottomSheetThemeData(
                  backgroundColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                ),
                textSelectionTheme: TextSelectionThemeData(
                  selectionColor: AppColors.anotherGreen.withOpacity(0.25),
                  cursorColor: AppColors.anotherGreen,
                  selectionHandleColor: AppColors.anotherGreen,
                ),
                dividerTheme: const DividerThemeData(color: AppColors.barelyGrey),
              ),
              scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),

              builder: (context, child) {
                // Initialize ScreenUtil here if necessary
                ScreenUtil.init(context);
                return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: const TextScaler.linear(0.775)),
                  child: Stack(
                    children: [
                      child!,
                      DropdownAlert(errorImage: 'assets/icons/errors.png',successImage: 'assets/icons/veri.png',errorBackground: Colors.red,successBackground: AppColors.anotherGreen,contentStyle: TStyle.h5.copyWith(
                        color: Colors.white,
                      ),titleStyle: TStyle.h5.copyWith(
                        color: Colors.white,
                      ),)
                    ],
                  ),
                );
              },
            );
          },
        );

  }
}