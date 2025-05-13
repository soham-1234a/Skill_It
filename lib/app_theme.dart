import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    final colorScheme = ColorScheme.dark(
      primary: const Color(0xFFBB86FC),       // A vibrant purple for primary elements
      secondary: const Color(0xFF03DAC6),     // A bright teal for accents and secondary actions
      surface: const Color(0xFF1E1E1E),       // A very dark grey, slightly lighter than background, for cards and elevated surfaces
      background: const Color(0xFF121212),   // A deep dark grey for the main background
      error: const Color(0xFFCF6679),         // Standard Material dark theme error color (pinkish-red)
      
      onPrimary: Colors.black,                // Text/icons on primary color (e.g., button text)
      onSecondary: Colors.black,              // Text/icons on secondary color
      onSurface: Colors.white,                // Text/icons on surface color (e.g., card text)
      onBackground: Colors.white,             // Text/icons on background color (e.g., general screen text)
      onError: Colors.black,                  // Text/icons on error color
    );

    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.background,
      fontFamily: 'Roboto', // Default font, can be configured via pubspec.yaml

      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface, 
        elevation: 4.0, 
        iconTheme: IconThemeData(color: colorScheme.onSurface), 
        titleTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      cardTheme: CardTheme(
        color: colorScheme.surface, 
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2C2C2C), // Slightly distinct dark shade for input fields
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none, 
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: colorScheme.primary, width: 2.0), 
        ),
        labelStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.8)),
        hintStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.6)),
        errorStyle: TextStyle(color: colorScheme.error, fontWeight: FontWeight.w500),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 2,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.secondary, 
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600, 
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface, 
        selectedItemColor: colorScheme.primary, 
        unselectedItemColor: colorScheme.onSurface.withOpacity(0.70), 
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
        type: BottomNavigationBarType.fixed, 
        elevation: 8, 
      ),

      textTheme: Typography.whiteMountainView.copyWith( // A good base for dark themes
        headlineSmall: Typography.whiteMountainView.headlineSmall?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        titleLarge: Typography.whiteMountainView.titleLarge?.copyWith(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        bodyLarge: Typography.whiteMountainView.bodyLarge?.copyWith(
          color: colorScheme.onSurface.withOpacity(0.9),
          fontSize: 16,
        ),
        bodyMedium: Typography.whiteMountainView.bodyMedium?.copyWith(
          color: colorScheme.onSurface.withOpacity(0.87), // Standard opacity for body text
          fontSize: 14,
        ),
        labelLarge: Typography.whiteMountainView.labelLarge?.copyWith( // Often used for button text
          fontWeight: FontWeight.bold,
          fontSize: 16, 
        )
      ).apply(
        bodyColor: colorScheme.onBackground, 
        displayColor: colorScheme.onBackground, 
      ),

      iconTheme: IconThemeData(color: colorScheme.onSurface.withOpacity(0.87)), 

      dividerTheme: DividerThemeData(
        color: colorScheme.onSurface.withOpacity(0.20), 
        thickness: 1,
      ),
      
      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surface.withOpacity(0.8),
        disabledColor: Colors.grey.shade800,
        selectedColor: colorScheme.secondary,
        secondarySelectedColor: colorScheme.secondary, // Used when selected and parent is also selected (e.g. filter chip)
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), // Pill-like shape
        labelStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.87), fontWeight: FontWeight.w500),
        secondaryLabelStyle: TextStyle(color: colorScheme.onSecondary, fontWeight: FontWeight.w500), 
        brightness: Brightness.dark,
      ),
    );
  }
}