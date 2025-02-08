class CategoriesModel {
  int? id;
  String? nameAr;
  String? name;
  String? descriptionAr;
  String? description;
  String? image;

  CategoriesModel({
    id,
    nameAr,
    name,
    descriptionAr,
    description,
    image,
  });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameAr = json['name_ar'];
    name = json['name'];
    descriptionAr = json['description_ar'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name_ar'] = nameAr;
    data['name'] = name;
    data['description_ar'] = descriptionAr;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}
