import 'package:flutter/material.dart';
import 'package:pmsn2025/views/item_student_view.dart';

class ListStudentsScreen extends StatelessWidget {
  const ListStudentsScreen({super.key});

  @override
   Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Alumnos'),
        ),
        body: ListView(
          
          children: [
            ListTile(
              title: Text("Alumnos Grupo Base", style: TextStyle(fontSize: 20),),
              subtitle: Text("Enero - Junio"),
              trailing: Column(
                children: [
                  Text("2024", style: TextStyle(fontSize: 20),)
                ],
              ),
            ),
            ListView(
              padding: EdgeInsets.all(20),
              shrinkWrap: true,
              children: const[
                ItemStudentView(),
                SizedBox(height: 10),
                ItemStudentView()
              ],
            )
          ],
        )
      
    );
  }
}