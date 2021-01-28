
import 'package:flutter_provider_demo/business_logic/models/note_entity.dart';
import 'package:flutter_provider_demo/business_logic/utils/dio/address.dart';
import 'package:flutter_provider_demo/business_logic/utils/dio/dio_util.dart';
import 'package:flutter_provider_demo/generated/json/base/json_convert_content.dart';

class NoteApis {
  Future<NoteEntity> getNote(int size, int page) {
    return DioUtil.request(
      Address.getNote(size,page),
      RequestMethod.GET,
      tips: false,
      showLoading: true,
    ).then((value) {
      return JsonConvert.fromJsonAsT<NoteEntity>(value.data.result);
    });
  }
}