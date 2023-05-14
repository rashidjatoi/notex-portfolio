import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:notex/services/notes_services.dart';
import 'package:notex/services/services_constants.dart';
import 'package:notex/views/add_notes_view.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: FirebaseAnimatedList(
                  query: databaseRef,
                  itemBuilder: (context, snapshot, animation, index) {
                    final title = snapshot.child('title').value;
                    final desc = snapshot.child('desc').value;
                    final id = snapshot.child('id').value;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Slidable(
                        key: const ValueKey(0),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) async {
                                await NotesServices.deleteNotes(id: id);
                              },
                              backgroundColor: const Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ListTile(
                            title: Text("Title:  $title"),
                            subtitle: Text("Description:  $desc"),
                            onTap: () {
                              Get.to(
                                () => AddNotesView(
                                  titleUpdate: title.toString(),
                                  descriptionUpdate: desc.toString(),
                                  id: id.toString(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddNotesView());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
