import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
   
  static String routerName = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Settings') ,
      ),
       drawer: const SideBarMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const SizedBox(height: 10),
              const Text('Settings',style: TextStyle(fontSize: 45,fontWeight: FontWeight.w500)),
              const SizedBox(height: 30),
              const Divider(),
              SwitchListTile.adaptive(
                value: Preferences.isDarkMode,
                title: const Text('Darkmode'), 
                onChanged: (value) {
                  setState(() {
                    Preferences.isDarkMode=value;
                    final themeProvider= Provider.of<ThemeProvider>(context,listen: false);

                    value ? themeProvider.setDarkMode() : themeProvider.setLightMode();
                  });
                },
              ),
              const Divider(),
              radioListTile(initialValue:1,text:'Masculine'),
              const Divider(),
              radioListTile(initialValue:2,text:'Femenine'),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  onChanged: (value) {
                    setState(() {
                      Preferences.name=value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    helperText: 'Username'
                  ),
                ),
              ),
              
            ],
          ),
        ),
      )
    );
  }

  RadioListTile<int> radioListTile({required int initialValue, required String text}) {
    return RadioListTile<int>(
              value: initialValue,
              title:  Text(text),
              groupValue: Preferences.gender, 
              onChanged: (value) {
                setState(() {
                  Preferences.gender = value ?? initialValue;
                });
              },
            );
  }
}