import 'package:personal_finance_manager/models/base_db.model.dart';

class Category extends BaseDBModel {
  static const String categoryNameJSONKey = "categoryName";

  String categoryName;

  Category({
    required this.categoryName,
    String uuid = "",
  }) : super(uuid);

  @override
  BaseDBModel fromJson(Map json) {
    return Category(
        categoryName: json[categoryNameJSONKey],
        uuid: json[BaseDBModel.uuidJSONKey]);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson(),
      categoryNameJSONKey : categoryName,
    };
  }
}
