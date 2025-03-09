import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmsn2025/screens/list_students_screen.dart';
import 'package:pmsn2025/utils/global_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isValidating = false;
  bool _MantenerSesion = false;

  Future<void> _SaveSession(bool value)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('MantenerSesion', value);
  }

  @override
  
  Widget build(BuildContext context) {
    final txUser = TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Introduzca el usuario"
      ),
    );
    final txPass = TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Introduzca la contraseña"
      ),
    );
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            //opacity: .5,
            fit: BoxFit.cover,
            image: AssetImage("assets/Fondo.webp")
          )
        ),
        child:  Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top:500,
              child: ValueListenableBuilder(
                valueListenable:  GlobalValues.isValidating,
                builder: (context, value, child) {
                  return  value ? CircularProgressIndicator() : Container();
                },
              ), 
              //isValidating ? CircularProgressIndicator() : Container(),
            ),
            Positioned(
              top:125,
              child: Lottie.asset("assets/tecnm.json", height: 250),
            ),
            Positioned(
              bottom: 50,
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 250,
                width: MediaQuery.of(context).size.width*.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Column(
                children: [
                  txUser,
                  const SizedBox(height: 10),
                  txPass,
                  //GestureDetector()
                  InkWell(
                    onTap: (){
                      //isValidating = true;
                      GlobalValues.isValidating.value = true;
                      Future.delayed(Duration(milliseconds: 4000)).then((value){
                        GlobalValues.isValidating.value = false;
                        _SaveSession(_MantenerSesion);
                        Navigator.pushNamed(context, "/dash");
                      });
                    },
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=>ListStudentsScreen(),)
                    ),*/
                    child: Image.asset(
                      "assets/Boton.png",
                      height: 60,
                      
                    ),
                  )
                ],
              ),
             ),
            ),
            Transform.translate(
              offset: Offset(120, 370),
              child: Center(
                  child: InkWell(
                    child: Text(
                      "Sing Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.deepPurple
                      ),
                    ),
                    onTap: () {
                      GlobalValues.isValidating.value = true;
                      Future.delayed(Duration(milliseconds: 300)).then((value){
                        GlobalValues.isValidating.value = false;
                        Navigator.pushNamed(context, "/sin");
                      });
                    },
                    ),
                )
              ),
              Transform.translate(
              offset: Offset(120, 370),
              child: Center(
                  child: CheckboxListTile(
                    title: Text(
                      "Mantener Sesion",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black
                      ),
                    ),
                    value: _MantenerSesion, 
                    onChanged: (bool? value){
                      setState(() {
                        _MantenerSesion = value ?? false;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    ),
                )
              )
          ],
          
        ),
      ),
    );
  }
}