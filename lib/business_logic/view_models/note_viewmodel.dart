import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_demo/business_logic/models/note_entity.dart';
import 'package:flutter_provider_demo/services/apis/note_apis.dart';

class NoteViewModel extends ChangeNotifier{
  NoteEntity _noteEntity;
  NoteEntity get noteEntity => _noteEntity;

  set index(NoteEntity val) {
    _noteEntity = val;
    notifyListeners();
  }

  Future<void> initData() async {
    await NoteApis().getNote(10, 1).then((notes) async {
      if (notes != null) {
        _noteEntity=notes;
      }
    });
    notifyListeners();
  }
}