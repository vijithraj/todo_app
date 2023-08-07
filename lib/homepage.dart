import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider_class.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void showadd(BuildContext context) {
    String newiteam = "";
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Add Iteam"),
            content: TextField(
              onChanged: (value) {
                newiteam = value;
              },
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    if (newiteam.isNotEmpty) {
                      Provider.of<Todoprovider>(context, listen: false)
                          .addTodo(Todo(title: newiteam));
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text("Add"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final storeprovider = Provider.of<Todoprovider>(context);
    final store = storeprovider.todos;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Groceries",
          style: TextStyle(fontSize: 23, color: Colors.white),
        ),
        backgroundColor: Colors.brown.shade400,
      ),
      body: ListView.builder(
          itemCount: store.length,
          itemBuilder: (context, index) {
            final data = store[index];
            return ListTile(
              title: Text(data.title),
              leading: Checkbox(
                value: data.isCompleted,
                onChanged: (_) {
                  storeprovider.toggletodostatus(index);
                },
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Provider.of<Todoprovider>(context, listen: false)
                      .removedTodo(index);
                  // storeprovider.removedTodo(index);
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showadd(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
