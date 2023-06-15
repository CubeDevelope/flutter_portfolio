import 'package:intl/intl.dart';

abstract class BaseDBModel {
  static const String uuidJSONKey = "uuid";

  BaseDBModel(this.uuid);

  DateFormat baseDateFormat = DateFormat("dd/MM/yyyy");

  String? uuid;

  BaseDBModel fromJson(Map json);

  Map<String, dynamic> toJson() {
    return {
      uuidJSONKey : uuid,
    };
  }

}