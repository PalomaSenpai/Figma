import 'package:flutter/material.dart';
import 'package:pmsn2025/utils/global_values.dart';
import 'package:pmsn2025/utils/theme_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefersUser extends StatefulWidget {
  const PrefersUser({super.key});

  @override
  State<PrefersUser> createState() => _PrefersUserState();
}

class _PrefersUserState extends State<PrefersUser> {
  String _selectedTheme = 'Día';
  String _selectedFont = 'Roboto';
  final List<String> _fonts = ['Roboto', 'Novecento', 'Kachika'];


  Color _customPrimary = Colors.blue;
  Color _customSecondary = Colors.orange;
  Color _customSurface = Colors.grey[200]!;
  Color _customOnSurface = Colors.black;

  @override
  void initState() {
    super.initState();
    //_loadPreferences();
  }

  void _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedTheme = prefs.getString('theme') ?? 'Día';
      _selectedFont = prefs.getString('font') ?? 'Roboto';
      GlobalValues.fontFamily.value = _selectedFont;
      if (_selectedTheme == 'Perso') {
        _customPrimary = Color(prefs.getInt('customPrimary') ?? Colors.blue.value);
        _customSecondary = Color(prefs.getInt('customSecondary') ?? Colors.orange.value);
        _customSurface = Color(prefs.getInt('customSurface') ?? Colors.grey[200]!.value);
        _customOnSurface = Color(prefs.getInt('customOnSurface') ?? Colors.black.value);
        GlobalValues.themeApp.value = ThemeSettings.themePerso(
          primary: _customPrimary,
          secondary: _customSecondary,
          surface: _customSurface,
          onSurface: _customOnSurface,
        );
      }
    });
  }

  void _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', _selectedTheme);
    await prefs.setString('font', _selectedFont);
    if (_selectedTheme == 'Perso') {
      await prefs.setInt('customPrimary', _customPrimary.value);
      await prefs.setInt('customSecondary', _customSecondary.value);
      await prefs.setInt('customSurface', _customSurface.value);
      await prefs.setInt('customOnSurface', _customOnSurface.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO LIST'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTheme = 'Día';
                      GlobalValues.themeApp.value = ThemeSettings.lightTheme();
                      _savePreferences();
                    });
                  },
                  child: Text('Dia'),
                  style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTheme = 'Noche';
                      GlobalValues.themeApp.value = ThemeSettings.darkTheme();
                      _savePreferences();
                    });
                  },
                  child: Text("Noche"),
                  style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTheme = 'Perso';
                      GlobalValues.themeApp.value = ThemeSettings.themePerso(
                        primary: _customPrimary,
                        secondary: _customSecondary,
                        surface: _customSurface,
                        onSurface: _customOnSurface,
                      );
                      _savePreferences();
                    });
                  },
                  child: Text("Perso"),
                  style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Selecciona un tipo de fuente:"),
                DropdownButton<String>(
                  style: TextStyle(color: Colors.blueAccent),
                  value: _selectedFont,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedFont = newValue!;
                      _savePreferences();
                      GlobalValues.fontFamily.value = _selectedFont;
                    });
                  },
                  items: _fonts.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                if (_selectedTheme == 'Perso') ...[
                  SizedBox(height: 16),
                  Text("Personaliza tu tema:"),
                  DropdownButton<Color>(
                    style: TextStyle(color: Colors.blueAccent),
                    value: _customPrimary,
                    onChanged: (Color? newValue) {
                      setState(() {
                        _customPrimary = newValue!;
                        GlobalValues.themeApp.value = ThemeSettings.themePerso(
                          primary: _customPrimary,
                          secondary: _customSecondary,
                          surface: _customSurface,
                          onSurface: _customOnSurface,
                        );
                        _savePreferences();
                      });
                    },
                    items: [
                      DropdownMenuItem(value: Colors.blue, child: Text("Azul")),
                      DropdownMenuItem(value: Colors.red, child: Text("Rojo")),
                      DropdownMenuItem(value: Colors.green, child: Text("Verde")),
                    ],
                  ),
                  DropdownButton<Color>(
                    style: TextStyle(color: Colors.blueAccent),
                    value: _customSecondary,
                    onChanged: (Color? newValue) {
                      setState(() {
                        _customSecondary = newValue!;
                        GlobalValues.themeApp.value = ThemeSettings.themePerso(
                          primary: _customPrimary,
                          secondary: _customSecondary,
                          surface: _customSurface,
                          onSurface: _customOnSurface,
                        );
                        _savePreferences();
                      });
                    },
                    items: [
                      DropdownMenuItem(value: Colors.orange, child: Text("Naranja")),
                      DropdownMenuItem(value: Colors.purple, child: Text("Morado")),
                      DropdownMenuItem(value: Colors.teal, child: Text("Turquesa")),
                    ],
                  ),
                  DropdownButton<Color>(
                    style: TextStyle(color: Colors.blueAccent),
                    value: _customSurface,
                    onChanged: (Color? newValue) {
                      setState(() {
                        _customSurface = newValue!;
                        GlobalValues.themeApp.value = ThemeSettings.themePerso(
                          primary: _customPrimary,
                          secondary: _customSecondary,
                          surface: _customSurface,
                          onSurface: _customOnSurface,
                        );
                        _savePreferences();
                      });
                    },
                    items: [
                      DropdownMenuItem(value: Colors.grey[200]!, child: Text("Gris claro")),
                      DropdownMenuItem(value: Colors.white, child: Text("Blanco")),
                      DropdownMenuItem(value: Colors.grey[400]!, child: Text("Gris medio")),
                    ],
                  ),
                  DropdownButton<Color>(
                    style: TextStyle(color: Colors.blueAccent),
                    value: _customOnSurface,
                    onChanged: (Color? newValue) {
                      setState(() {
                        _customOnSurface = newValue!;
                        GlobalValues.themeApp.value = ThemeSettings.themePerso(
                          primary: _customPrimary,
                          secondary: _customSecondary,
                          surface: _customSurface,
                          onSurface: _customOnSurface,
                        );
                        _savePreferences();
                      });
                    },
                    items: [
                      DropdownMenuItem(value: Colors.black, child: Text("Negro")),
                      DropdownMenuItem(value: Colors.grey[800]!, child: Text("Gris oscuro")),
                      DropdownMenuItem(value: Colors.blueGrey, child: Text("Azul grisáceo")),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('MantenerSesion', false);
    Navigator.pushNamed(context, "/log");
  }
}