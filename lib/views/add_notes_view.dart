import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notex/services/notes_services.dart';

class AddNotesView extends StatelessWidget {
  final String titleUpdate;
  final String descriptionUpdate;
  final String id;
  const AddNotesView({
    super.key,
    this.titleUpdate = "",
    this.descriptionUpdate = "",
    this.id = "",
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController desc = TextEditingController();
    TextEditingController title = TextEditingController();
    final formKey = GlobalKey<FormState>();
    desc.text = descriptionUpdate;
    title.text = titleUpdate;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Notes"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            // title text form field
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: title,
                      decoration: const InputDecoration(
                        hintText: "Title",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 223, 219, 219),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter title';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 5),

                    // description form field
                    TextFormField(
                      maxLines: 20,
                      controller: desc,
                      decoration: const InputDecoration(
                        hintText: "Description",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 223, 219, 219),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter description';
                        }
                        return null;
                      },
                    ),
                  ],
                )),
            const SizedBox(height: 20),

            // Button
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  if (id.isEmpty) {
                    NotesServices.saveNotes(
                      title: title.text.toString(),
                      desc: desc.text.toString(),
                    );
                    Get.back();
                  } else {
                    NotesServices.updateNotes(
                      id: id,
                      title: title.text.toString(),
                      desc: desc.text.toString(),
                    );
                    Get.back();
                  }
                }
              },
              child: Text(
                id.isEmpty ? "Save" : "Update",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
