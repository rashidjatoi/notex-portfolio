import 'package:notex/services/services_constants.dart';
import 'package:notex/utils/utils.dart';

class NotesServices {
  static void saveNotes({title, desc}) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch;
      await databaseRef.child(id.toString()).set(
        {
          "id": id,
          "title": title,
          "desc": desc,
        },
      ).then((value) => showSnackBarMessage('Success', 'Notes Saved'));
    } catch (e) {
      showSnackBarMessage('Error', e.toString());
    }
  }

  static void updateNotes({id, title, desc}) async {
    try {
      await databaseRef.child(id.toString()).update(
        {
          "id": id,
          "title": title,
          "desc": desc,
        },
      ).then((value) => showSnackBarMessage('Success', 'Notes Updated'));
    } catch (e) {
      showSnackBarMessage('Error', e.toString());
    }
  }

  static deleteNotes({id}) async {
    try {
      await databaseRef
          .child(id.toString())
          .remove()
          .then((value) => showSnackBarMessage('Success', 'Notes Delete'));
    } catch (e) {
      showSnackBarMessage('Error', e.toString());
    }
  }
}
