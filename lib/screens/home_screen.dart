import 'package:flutter/material.dart';
import 'package:preferences_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {


  static String routerName = 'Home';
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        
      ),
      drawer: const SideBarMenu(),
      body: const Center(
         child: Text('HomeScreen'),
      ),
    );
  }
}