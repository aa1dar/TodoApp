import 'package:flutter/material.dart';
import 'package:todo_app/utils/style/app_colors.dart';

class AppTheme {
  static const appBarIconSplashRadius = Material.defaultSplashRadius * 0.5;
  static const textTheme = TextTheme(
      titleLarge: TextStyle(
          fontSize: 32.0, height: 1.1875, fontWeight: FontWeight.w500),
      titleMedium:
          TextStyle(fontSize: 20.0, height: 1.6, fontWeight: FontWeight.w500),
      labelLarge:
          TextStyle(fontSize: 14.0, height: 1.714, fontWeight: FontWeight.w500),
      bodyMedium:
          TextStyle(fontSize: 16.0, height: 1.25, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(
          fontSize: 14.0, height: 1.4286, fontWeight: FontWeight.w400));

  static ThemeData lightTheme() => ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: AppColor.backLightPrimary,
      fontFamily: 'Roboto',
      primaryColor: AppColor.colorLightBlue,
      colorScheme: const ColorScheme.light().copyWith(
          primary: AppColor.colorLightBlue,
          secondary: AppColor.colorLightBlue,
          brightness: Brightness.light,
          tertiary: AppColor.labelLightTertiary,
          tertiaryContainer:  AppColor.colorLightGray,
          error: AppColor.colorLightRed,
          secondaryContainer: AppColor.colorLightGreen,
          surface: AppColor.labelLightDisable),
      primaryIconTheme: const IconThemeData(color: AppColor.labelLightPrimary),
      iconTheme: const IconThemeData(color: AppColor.colorLightWhite),
      // iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(visualDensity: VisualDensity.compact)),
      switchTheme: SwitchThemeData(trackColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColor.colorLightBlue.withOpacity(0.3);
        }
        return AppColor.supprotLightOverlay;
      }), thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColor.colorLightBlue;
        }
        return AppColor.backLightElevated;
      })),
      checkboxTheme: const CheckboxThemeData(
          fillColor: MaterialStatePropertyAll(AppColor.supportLightSeparator),
          checkColor: MaterialStatePropertyAll(AppColor.backLightSecondary)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColor.colorLightBlue,
          foregroundColor: AppColor.colorLightWhite),
      dividerColor: AppColor.supportLightSeparator,
      textTheme: textTheme,
      buttonTheme: const ButtonThemeData(
          buttonColor: AppColor.colorLightBlue,
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          alignedDropdown: false),
      // textButtonTheme: TextButtonThemeData(
      //     style: ButtonStyle(
      //         padding: MaterialStatePropertyAll(
      //   EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
      // ))),
      cardColor: AppColor.backLightSecondary,
      appBarTheme: const AppBarTheme(
        color: AppColor.backLightPrimary,
        surfaceTintColor: AppColor.backLightPrimary,
        centerTitle: true,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle:
            textTheme.bodyMedium!.copyWith(color: AppColor.labelLightTertiary),
        border: InputBorder.none,
      ),
      textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColor.supportLightSeparator,
          selectionColor: AppColor.colorLightGrayLight,
          selectionHandleColor: AppColor.colorLightGray)
      // inputDecorationTheme: const InputDecorationTheme(
      //   labelStyle: TextStyle(color: Colors.black45),
      // focusedBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     style: BorderStyle.solid,
      //     width: 2.0,
      //     color: Colors.black87,
      //   ),
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(8.0),
      //     ),
      //   ),
      //   enabledBorder: OutlineInputBorder(
      //     borderSide: BorderSide(
      //       style: BorderStyle.solid,
      //       width: 2.0,
      //       color: Colors.black87,
      //     ),
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(8.0),
      //     ),
      //   ),
      //   border: OutlineInputBorder(
      //     borderSide: BorderSide(
      //       style: BorderStyle.solid,
      //       width: 1.0,
      //       color: Colors.black87,
      //     ),
      //     borderRadius: BorderRadius.all(
      //       Radius.circular(8.0),
      //     ),
      //   ),
      // ),
      );

  static ThemeData darkTheme() => ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: AppColor.backDarkPrimary,
        primaryColor: AppColor.backDarkPrimary,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: AppColor.backDarkPrimary,
          secondary: AppColor.backDarkSecondary,
          brightness: Brightness.dark,
        ),
        // textButtonTheme: TextButtonThemeData(
        //     style: ButtonStyle(
        //   foregroundColor: MaterialStateProperty.all(Colors.black87),
        //   overlayColor: MaterialStateProperty.all(
        //     Colors.black54,
        //   ),
        // )),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
          centerTitle: true,
        ),
        // inputDecorationTheme: const InputDecorationTheme(
        //   labelStyle: TextStyle(color: Colors.black45),
        //   focusedBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       style: BorderStyle.solid,
        //       width: 2.0,
        //       color: Colors.black87,
        //     ),
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(8.0),
        //     ),
        //   ),
        //   enabledBorder: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       style: BorderStyle.solid,
        //       width: 2.0,
        //       color: Colors.black87,
        //     ),
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(8.0),
        //     ),
        //   ),
        //   border: OutlineInputBorder(
        //     borderSide: BorderSide(
        //       style: BorderStyle.solid,
        //       width: 1.0,
        //       color: Colors.black87,
        //     ),
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(8.0),
        //     ),
        //   ),
        // ),
      );
}
