import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreeenState();
}

class _SingupScreeenState extends State<SingupScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _selecImageFromGallery() async{
    final XFile? selecFile = await _picker.pickImage(source: ImageSource.gallery);
    if (selecFile != null ){
      setState(() {
        _image = File(selecFile.path);
      });
    }
  } 

  Future<void> _CameraImage()async{
    final XFile? cameraFile = await _picker.pickImage(source: ImageSource.camera);
    if (cameraFile != null) {
      setState(() {
        _image = File(cameraFile.path);
      });
    }
  }

  void _ShowDialog(){
    showModalBottomSheet(
      context: context, 
      builder: (BuildContext context){
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Galeria'),
                onTap: () {
                  _selecImageFromGallery();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text("Camara"),
                onTap: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/Fondo.webp"))
      ),
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(0, 0),
            child: Center(
              child: Container(
                height: 500,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 10
                    )
                  ],
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1
                  )
                ),
                child: Stack(
                  children: [
                    Transform.translate(
                      offset: Offset(0, 0),
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: MediaQuery.paddingOf(context),
                              child: GestureDetector(
                                onTap: _ShowDialog,
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.grey.shade300,
                                  backgroundImage: _image != null ?FileImage(_image!) :null,
                                  child: _image == null
                                        ? Icon(Icons.camera_alt, size: 40, color: Colors.grey) : null,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Introduzca su nombre",
                                style: TextStyle(
                                  
                                ),
                                ),
                            ),
                            Center(
                              child: SizedBox(
                              height: 50,
                              width: 200,
                              child: TextFormField(
                                decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width:  1.5
                                  )
                                ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: 1.5
                                )
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color:  Colors.blue,
                                  width: 2
                                )
                              ),
                              label: Text("Nombre"),
                              labelStyle: TextStyle(
                                color: Colors.blue,
                                fontSize: 21,
                                fontWeight: FontWeight.bold
                              ),
                              
                              ),
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.black,fontSize: 16,),
                              ),
                            ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Center(
                              
                              child: Text(
                                "Introduzca su nombre",
                                style: TextStyle(
                                  
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                              height: 50,
                              width: 200,
                              child: TextFormField(
                                decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width:  1.5
                                  )
                                ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: 1.5
                                )
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color:  Colors.blue,
                                  width: 2
                                )
                              ),
                              label: Text("Nombre"),
                              labelStyle: TextStyle(
                                color: Colors.blue,
                                fontSize: 21,
                                fontWeight: FontWeight.bold
                              ),
                              
                              ),
                              keyboardType: TextInputType.text,
                              style: TextStyle(color: Colors.black,fontSize: 16,),
                              ),
                            ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
        
      ));
  }
}