import 'package:flutter/material.dart';
import 'package:preferences_app/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
   
  static String routerName = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Settings') ,
      ),
       drawer: const SideBarMenu(),
      body: const Center(
         child: Text('SettingsScreen'),
      ),
    );
  }
}