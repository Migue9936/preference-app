import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_)=>ThemeProvider(isDarkMode: Preferences.isDarkMode))
      ],
      child:const MyApp(),
    )
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routerName,
      theme:  Provider.of<ThemeProvider>(context).currentTheme.copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Provider.of<ThemeProvider>(context).currentTheme.brightness == Brightness.dark ? Colors.amber: Colors.green
        )
      ),
      routes: {
        HomeScreen.routerName :(context) => const HomeScreen(),
        SettingsScreen.routerName :(context) => const SettingsScreen(),
      },
    );
  }
}