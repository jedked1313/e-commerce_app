class ItemsModel {
  int? id;
  int? categoryId;
  String? nameAr;
  String? name;
  String? descriptionAr;
  String? description;
  List<ItemsImagesModel>? images;
  int? quantity;
  int? isActive;
  int? price;
  int? discount;
  int? isFavorite;
  String? createdAt;
  String? updatedAt;
  ItemsCategoryModel? category;

  ItemsModel(
      {id,
      categoryId,
      nameAr,
      name,
      descriptionAr,
      description,
      images,
      quantity,
      isActive,
      price,
      discount,
      isFavorite,
      createdAt,
      updatedAt,
      category});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    nameAr = json['name_ar'];
    name = json['name'];
    descriptionAr = json['description_ar'];
    description = json['description'];
    if (json['images'] != null) {
      images = <ItemsImagesModel>[];
      json['images'].forEach((v) {
        images!.add(ItemsImagesModel.fromJson(v));
      });
    }
    quantity = json['quantity'];
    isActive = json['is_active'];
    price = json['price'];
    discount = json['discount'];
    isFavorite = json['isFavorite'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? ItemsCategoryModel.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name_ar'] = nameAr;
    data['name'] = name;
    data['description_ar'] = descriptionAr;
    data['description'] = description;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['quantity'] = quantity;
    data['is_active'] = isActive;
    data['price'] = price;
    data['discount'] = discount;
    data['isFavorite'] = isFavorite;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class ItemsImagesModel {
  int? itemId;
  String? image;

  ItemsImagesModel({itemId, image});

  ItemsImagesModel.fromJson(Map<String, dynamic> json) {
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

class ItemsCategoryModel {
  int? id;
  String? name;

  ItemsCategoryModel({id, name});

  ItemsCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
