import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:pmsn2025/utils/global_values.dart';
import 'package:pmsn2025/utils/theme_settings.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    //final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenidos"),
        actions: [
          DarlightButton(
            type: Darlights.DarlightThree,
            onChange: (value){
              if(value == ThemeMode.light){
                GlobalValues.themeApp.value = ThemeSettings.lightTheme();
              }else{
                GlobalValues.themeApp.value =ThemeSettings.darkTheme();
              }
            },
            //options: DarlightOneOption(),
          ),
        ],
      ),
      
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://insightcrime.org/wp-content/uploads/2017/11/Alias-El-Mencho-Mexico.jpg"),
              ),
              accountName: Text('Rubensin Torres Frias'), 
              accountEmail: Text('ruben.torres@itcelaya.edu.mx')
              ),
              ListTile(
                onTap: ()=>Navigator.pushNamed(context,"/wel"),
                leading: Icon(Icons.design_services),
                title: Text("Practica Figma"),
                subtitle: Text("Frontend App"),
                trailing: const Icon(Icons.chevron_right),
              ),
              ListTile(
                onTap: ()=>Navigator.pushNamed(context,"/todo"),
                leading: Icon(Icons.task),
                title: Text("Todo App"),
                subtitle: Text("Task List"),
                trailing: const Icon(Icons.chevron_right),
              )
          ],
        ),
      ),
      //endDrawer: Drawer(),
    );
  }
}