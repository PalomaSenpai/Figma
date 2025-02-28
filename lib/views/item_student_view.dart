import 'package:flutter/material.dart';

class ItemStudentView extends StatelessWidget {
  const ItemStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF006BD8)),
        //color: Colors.green,
        borderRadius: BorderRadius.circular(5),
        
      ),
      child: Column(
        children: [
          Expanded(
            child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://insightcrime.org/wp-content/uploads/2017/11/Alias-El-Mencho-Mexico.jpg"),
            ),
            title: Text("Rubensin Torres Frias"),
            subtitle: Text("No.Control: 01031351"),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height *.13,
              
              decoration: const BoxDecoration(
                color: Color(0xFF006BDB8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Table(
                      
                        children: [
                          TableRow(
                            children: [
                              Center(child: Text('Semestre')),
                              Center(child: Text('Clave Materia')),
                              Center(child: Text('Grupo'))
                            ],
                          ),
                          TableRow(
                            children: [
                              Center(child: Text('6')),
                              Center(child: Text('DM13')),
                              Center(child: Text('B'))
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 16,),
                      Text('INGENIERIA EN SISTEMAS COMPUTACIONALES',
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                      )
                    
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}