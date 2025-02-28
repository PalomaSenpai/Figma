import 'package:flutter/material.dart';
import 'package:pmsn2025/database/task_databa.dart';
import 'package:pmsn2025/models/todo_model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  
  TaskDatabasa? databasa;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databasa = TaskDatabasa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO LIST'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_task),
        onPressed: ()=>_dialogBuilder(context)
        ),
      body: FutureBuilder(
        future: databasa!.SELECT(), 
        builder: (context, AsyncSnapshot<List<TodoModel>> snapshot) {
          if(snapshot.hasError){
            return Text(snapshot.error.toString()); //const Center(child: Text('ALGO OCURRIO DURANTE LA EJECUCION'),);
          }else{
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index){
                  var obj = snapshot.data![index];
                  return Container(
                    height: 150,
                    child: Column(
                      children:[
                        ListTile(
                          title: Text(obj.titleTodo!/*snapshot.data![index].titleTodo!*/),
                          subtitle: Text(obj.dateTodo!),
                          trailing: Builder(builder: (context){
                            if(obj.sttTodo==true){
                              return Icon(Icons.check);
                            }else{
                              return Icon(Icons.close);
                            }
                          }),
                        ),
                        Text(obj.dscTodo!)
                      ]
                    )
                  );
                },
              );
            }else{
              return const Center(child: CircularProgressIndicator());
            }
          }
        },
        ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context){
    return showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text('Add Task')
          );
      }
      );
  }
}