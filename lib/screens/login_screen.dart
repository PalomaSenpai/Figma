import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmsn2025/screens/list_students_screen.dart';
import 'package:pmsn2025/utils/global_values.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isValidating = false;
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
                        Navigator.pushNamed(context, "/dash");
                      });
                    },
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=>ListStudentsScreen(),)
                    ),*/
                    child: Image.asset(
                      "assets/Boton.png",
                      height: 80
                    ),
                  )
                ],
              ),
             ),
            )
          ],

        ),
      ),
    );
  }
}