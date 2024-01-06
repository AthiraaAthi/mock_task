import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_05_1_24/controller/my_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  TextEditingController namecontroller = TextEditingController();
  TextEditingController editcontroller = TextEditingController();
  CollectionReference UserCollection =
      FirebaseFirestore.instance.collection("Name");
  MyController myControllerobj = MyController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyApp")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: namecontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      myControllerobj.addData(name: namecontroller.text);
                      namecontroller.clear();
                      Navigator.pop(context);
                    },
                    child: Text("save"),
                  ),
                ],
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: UserCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot userdetails = snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 148, 251, 151),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) => Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            TextField(
                                              controller: editcontroller,
                                              decoration: InputDecoration(
                                                  hintText: "Enter New name",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                  myControllerobj.editData(
                                                      id: userdetails.id,
                                                      Newname:
                                                          editcontroller.text);
                                                  editcontroller.clear();
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Save"))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  myControllerobj.deleteData(
                                      id: userdetails.id);
                                },
                                icon: Icon(Icons.delete))
                          ],
                        ),
                        Center(child: Text("${userdetails["Username"]} ")),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Text("Enter Some value");
          }
        },
      ),
    );
  }
}
