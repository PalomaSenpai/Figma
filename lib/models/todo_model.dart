import 'dart:ffi';

class TodoModel {
  int? idTodo;
  String? titleTodo;
  String? dscTodo;
  String? dateTodo;
  Bool? sttTodo;

  TodoModel({this.idTodo,this.titleTodo,this.dscTodo,this.dateTodo,this.sttTodo});
    /*{
      this.idTodo = idTodo;
      }
    */ 
  factory TodoModel.fromMap(Map<String,dynamic> map){
    return TodoModel(
      idTodo: map['idTodo'],
      titleTodo: map['titleTodo'],
      dscTodo: map['dscTodo'],
      dateTodo: map['dateTodo'],
      sttTodo: map['sttTodo']
    );
  }
}