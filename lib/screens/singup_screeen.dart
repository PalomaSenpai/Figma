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
   final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passswordController = TextEditingController();

  String? _validarEmail(String? value){
    if (value == null || value.isEmpty) {
      return'El correo electrónico es obligatorio';
    }if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)){
      return 'Introduce un correo electrónico válido';
    }
  }

  String? _validarCampo(String? value, String fieldName){
    if (value==null||value.isEmpty) {
      return 'El $fieldName es obligatorio';
    }
    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Si el formulario es válido, procede con el registro
      print('Nombre: ${_nameController.text}');
      print('Correo: ${_emailController.text}');
      print('Contraseña: ${_passswordController.text}');
      // Aquí puedes agregar la lógica para registrar al usuario
    }
  }

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
                child: Form(
                  key: _formKey,
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
                                  "Nombre",
                                  style: TextStyle(
                                    
                                  ),
                                  ),
                              ),
                              Center(
                                child: SizedBox(
                                height: 50,
                                width: 200,
                                child: TextFormField(
                                  controller: _nameController,
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
                                
                                ),
                                keyboardType: TextInputType.text,
                                style: TextStyle(color: Colors.black,fontSize: 16,),
                                validator: (value) => _validarCampo(value, 'nombre'),
                                ),
                              ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Center(
                                
                                child: Text(
                                  "Correo",
                                  style: TextStyle(
                                    
                                  ),
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                height: 50,
                                width: 200,
                                child: TextFormField(
                                  controller: _emailController,
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
                                
                                ),
                                keyboardType: TextInputType.text,
                                style: TextStyle(color: Colors.black,fontSize: 16,),
                                validator: _validarEmail,
                                ),
                              ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Center(
                                
                                child: Text(
                                  "Contraseña",
                                  style: TextStyle(
                                    
                                  ),
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                height: 50,
                                width: 200,
                                child: TextFormField(
                                  controller: _passswordController,
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
                                ),
                                keyboardType: TextInputType.text,
                                style: TextStyle(color: Colors.black,fontSize: 16,),
                                validator: (value) => _validarCampo(value, 'contraseña'),
                                obscureText: true,
                                
                                ),
                              ),
                              ),
                              SizedBox(height: 20,),
                              ElevatedButton(onPressed: _submitForm, child: Text("Registrarse"),)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
        
      ));
  }
}