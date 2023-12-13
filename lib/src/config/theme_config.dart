import 'package:flutter/material.dart';

import 'color_config.dart';

// ignore: avoid_classes_with_only_static_members
class ThemeConfig {
  ThemeConfig._();
  // Use HSV color space for proper LERPing.
  static Color _lerp(Color a, Color b, double t) =>
      HSVColor.lerp(HSVColor.fromColor(a), HSVColor.fromColor(b), t)!.toColor();

  static ThemeData createTheme(
    ColorScheme colorScheme,
  ) {
    final baseTextTheme = colorScheme.brightness == Brightness.dark
        ? Typography.blackMountainView
        : Typography.whiteMountainView;

    final onBackground50 = _lerp(
      colorScheme.background,
      colorScheme.onBackground,
      0.50,
    );

    final onBackground15 = _lerp(
      colorScheme.background,
      colorScheme.onBackground,
      0.15,
    );

    const shadow = Styleguide.colorGray_9;

    final textTheme = _createTextTheme(baseTextTheme, colorScheme);
    return ThemeData(
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      disabledColor: onBackground50,
      tabBarTheme: TabBarTheme(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: colorScheme.onPrimary,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Styleguide.colorAccentsOrange_1,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      dividerColor: onBackground15,
      dividerTheme: DividerThemeData(
        color: onBackground15,
        space: 1,
        thickness: 1,
        indent: 0,
        endIndent: 0,
      ),
      cardTheme: CardTheme(
        color: colorScheme.surface,
        shadowColor: shadow,
        margin: EdgeInsets.zero,
      ),
      appBarTheme: AppBarTheme(
        color: colorScheme.background,
      ),
      iconTheme: const IconThemeData(
        size: 20.0,
      ),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary,
        colorScheme: colorScheme,
        height: 52,
      ),
      textTheme: textTheme,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.primary,
        elevation: 4.0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle:
            textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
        unselectedLabelStyle:
            textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w300),
        type: BottomNavigationBarType.fixed,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
      ),
      colorScheme: colorScheme.copyWith(background: colorScheme.background),
    );
  }

  static TextTheme _createTextTheme(
      TextTheme baseTextTheme, ColorScheme colorScheme) {
    return TextTheme(
      displayLarge: baseTextTheme.displayLarge?.copyWith(
        color: colorScheme.onBackground,
        fontSize: 28,
      ),
      displayMedium: baseTextTheme.displayMedium?.copyWith(
        color: colorScheme.onBackground,
        fontSize: 24,
      ),
      displaySmall: baseTextTheme.displaySmall?.copyWith(
        color: colorScheme.onBackground,
        fontSize: 20,
      ),
      headlineMedium: baseTextTheme.headlineMedium?.copyWith(
        color: colorScheme.onBackground,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      headlineSmall: baseTextTheme.headlineSmall?.copyWith(
        color: colorScheme.onBackground,
        fontSize: 16,
      ),
      titleLarge: baseTextTheme.titleLarge?.copyWith(
        color: colorScheme.onBackground,
        fontSize: 14,
      ),
      bodyLarge: baseTextTheme.bodyLarge?.copyWith(
        color: colorScheme.onBackground,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: baseTextTheme.bodyMedium?.copyWith(
        color: colorScheme.onBackground,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: baseTextTheme.labelLarge?.copyWith(
        color: colorScheme.onBackground,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: baseTextTheme.bodySmall?.copyWith(
        color: colorScheme.onBackground,
        fontSize: 11,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: baseTextTheme.labelSmall?.copyWith(
        color: colorScheme.onBackground,
        fontSize: 11,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: baseTextTheme.titleMedium?.copyWith(
        color: colorScheme.onBackground,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: baseTextTheme.titleSmall?.copyWith(
        color: colorScheme.onBackground,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static ThemeData get lightTheme => createTheme(
        const ColorScheme(
          brightness: Brightness.light,
          background: Styleguide.colorGray_0,
          onBackground: Styleguide.colorGray_9,
          surface: Styleguide.colorGray_0,
          onSurface: Styleguide.colorGray_9,
          primary: Styleguide.colorAccentsOrange_1,
          onPrimary: Styleguide.colorGray_0,
          secondary: Styleguide.colorAccentsYellow_2,
          onSecondary: Styleguide.colorGray_9,
          error: Styleguide.colorAccentsRed,
          onError: Styleguide.colorGray_0,
        ),
      );

  static ThemeData get darkTheme => createTheme(
        const ColorScheme(
          brightness: Brightness.dark,
          background: Styleguide.colorGray_9,
          onBackground: Styleguide.colorGray_1,
          surface: Styleguide.colorGray_8,
          onSurface: Styleguide.colorGray_0,
          primary: Styleguide.colorAccentsOrange_1,
          onPrimary: Styleguide.colorGray_0,
          secondary: Styleguide.colorAccentsYellow_1,
          onSecondary: Styleguide.colorGray_9,
          error: Styleguide.colorAccentsRed,
          onError: Styleguide.colorGray_0,
        ),
      );
}
