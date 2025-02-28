import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:
        Stack(
          children: [
            Transform.translate(
              offset: Offset(0, -370),
              child: Center(
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromRGBO(198,211,89,10)
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(

                height: 300,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(179, 160, 255, 10)
                ),
                child: Stack(
                  children: [
                    
                    Positioned(
                      bottom: 185,
                      left: 80,
                      child: SizedBox(
                        height: 50,
                        width: 250,
                        child: TextFormField(

                          decoration: InputDecoration(

                            border: OutlineInputBorder(),
                            hintText: "Email or User",
                            hintStyle: TextStyle(
                              color: Colors.grey
                            ),
                            filled: true,
                            fillColor: Colors.white
                          ),
                        )
                      ),
                        
                    ),
                    Positioned(
                      bottom: 240,
                      left: 85,
                      child: Text(
                        "Username or Email",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18, // Tamaño de la fuente
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),

                    Positioned(
                      bottom: 120,
                      left: 85,
                      child: Text(
                        "Password",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18, // Tamaño de la fuente
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),

                    Positioned(
                      bottom: 65,
                      left: 80,
                      child: SizedBox(
                        height: 50,
                        width: 250,
                        child: TextFormField(

                          decoration: InputDecoration(

                            border: OutlineInputBorder(),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Colors.grey
                            ),
                            filled: true,
                            fillColor: Colors.white
                          ),
                        )
                      ),
                        
                    ),
                    Positioned(
                      bottom: 25,
                      left: 230,
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Colors.black
                        ),
                        )
                    )
                  ],
                ),

              ),

            ),
            Transform.translate(
              offset: Offset(0, -300),
              child: Center(
                child: Text("Welcome",
                  style: TextStyle(
                  fontSize: 30, // Tamaño de la fuente
                  fontWeight: FontWeight.bold
                )
                ),
                
              ),
            ),
            Transform.translate(
              offset: Offset(0, 200),
              child: Center(
                child: ElevatedButton(
                  onPressed: (){

                  },
                  child: const Text(
                  style: TextStyle(
                    color: Colors.white
                  ),
                    "Continuar"
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shadowColor: Colors.grey
                  ),
                ),
              ),
          
            ),

            Transform.translate(
              offset: Offset(0, 670),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.facebook)
                  ),
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.g_mobiledata)
                  ),
                  IconButton(
                    onPressed: (){}, 
                    icon: Icon(Icons.face)
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, 340),
              child: Center(
                child: TextButton(
                onPressed: (){

                }, 
                child:Text("Don't have an account? Sign Up")),
              )
            )
          ],
        )
      ,
    );
  }
}