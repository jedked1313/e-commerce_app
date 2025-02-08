class FavoritesModel {
  int? id;
  String? name;
  String? nameAr;
  String? descriptionAr;
  String? description;
  int? price;
  int? discount;
  List<Images>? images;

  FavoritesModel(
      {id, name, nameAr, descriptionAr, description, price, discount, images});

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    descriptionAr = json['description_ar'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_ar'] = nameAr;
    data['description_ar'] = descriptionAr;
    data['description'] = description;
    data['price'] = price;
    data['discount'] = discount;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? itemId;
  String? image;

  Images({itemId, image});

  Images.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['image'] = image;
    return data;
  }
}
