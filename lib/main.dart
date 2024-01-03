import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/tabs.dart';


var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 131, 57, 0),
);

// var kDarkColorScheme = ColorScheme.fromSeed(
//   brightness: Brightness.dark,
//   seedColor: const Color.fromARGB(255, 5, 9, 125),
// );

void main() {
  runApp(
      MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onBackground,
            foregroundColor: kColorScheme.onPrimary,
            // foregroundColor: Colors.white,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
            unselectedItemColor: kColorScheme.onPrimary,
            selectedItemColor: kColorScheme.primary,
            backgroundColor: kColorScheme.onBackground,
          ),
          scaffoldBackgroundColor: kColorScheme.onBackground,
          colorScheme: kColorScheme,
          useMaterial3: true,
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        home: const TabsScreen(),  // tabs.dart
      ),

    //     MaterialApp(
    //       debugShowCheckedModeBanner: false,
    //       darkTheme: ThemeData.dark().copyWith(
    //         useMaterial3: true,
    //         colorScheme: kDarkColorScheme,
    //         cardTheme: const CardTheme().copyWith(
    //           color: kDarkColorScheme.secondaryContainer,
    //           margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8,),
    //         ),
    //         elevatedButtonTheme: ElevatedButtonThemeData(
    //           style: ElevatedButton.styleFrom(
    //             backgroundColor: kDarkColorScheme.primaryContainer,  // or Colors.white,
    //             foregroundColor: kDarkColorScheme.onSecondaryContainer,
    //           ),
    //         ),
    //       ),
    //       theme: ThemeData().copyWith(   // or ThemeData(useMaterial3: true,.......),
    //         useMaterial3: true,
    //         scaffoldBackgroundColor: Colors.white,
    //         colorScheme: kColorScheme,
    //         appBarTheme: const AppBarTheme().copyWith(
    //           backgroundColor: kColorScheme.onPrimaryContainer,  // or Colors.white10,   // Background color of the app bar
    //           foregroundColor: kColorScheme.primaryContainer,    // or Colors.white10,   // Text color of the app bar
    //         ),
    //         textTheme: ThemeData().textTheme.copyWith(
    //           titleLarge: TextStyle(    // AppBar text
    //             fontWeight: FontWeight.bold,
    //             color: kColorScheme.onSecondaryContainer, // if we do like this Colors.white it does not change appbar text color because we have already set appBar color in appBarTheme's foregroundColor
    //             fontSize: 18,
    //           ),),
    //         elevatedButtonTheme: ElevatedButtonThemeData(
    //           style: ElevatedButton.styleFrom(
    //             backgroundColor: kColorScheme.primaryContainer,  // or Colors.white,  // Background color of elevated buttons
    //           ),
    //         ),
    //         cardTheme: const CardTheme().copyWith(
    //           color: kColorScheme.secondaryContainer,      // Background color of cards
    //           margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8,),
    //         ),
    //       ),
    //       // themeMode: ThemeMode.system, // this is already default so we don't need to set this
    //       home: const TabsScreen(),  // expenses.dart
    //     ),

  );
}


//  category.dart -> meal.dart -> dummy_data.dart -> main.dart -> tabs.dart -> categories.dart -> category_grid_item.dart -> categories.dart -> meals.dart -> meal_item.dart -> meal_item_trait.dart -> meal_item.dart -> meal_details.dart
