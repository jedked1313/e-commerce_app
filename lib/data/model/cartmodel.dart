class CartModel {
  int? userId;
  int? itemId;
  int? quantity;
  Items? items;

  CartModel({this.userId, this.itemId, this.quantity, this.items});

  CartModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    itemId = json['item_id'];
    quantity = json['quantity'];
    items = json['items'] != null ? Items.fromJson(json['items']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['item_id'] = itemId;
    data['quantity'] = quantity;
    if (items != null) {
      data['items'] = items!.toJson();
    }
    return data;
  }
}

class Items {
  int? id;
  int? categoryId;
  String? nameAr;
  String? name;
  String? descriptionAr;
  String? description;
  int? images;
  int? quantity;
  int? isActive;
  int? price;
  int? discount;
  String? createdAt;
  String? updatedAt;
  SingleImage? singleImage;

  Items(
      {this.id,
      this.categoryId,
      this.nameAr,
      this.name,
      this.descriptionAr,
      this.description,
      this.images,
      this.quantity,
      this.isActive,
      this.price,
      this.discount,
      this.createdAt,
      this.updatedAt,
      this.singleImage});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    nameAr = json['name_ar'];
    name = json['name'];
    descriptionAr = json['description_ar'];
    description = json['description'];
    images = json['images'];
    quantity = json['quantity'];
    isActive = json['is_active'];
    price = json['price'];
    discount = json['discount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    singleImage = json['single_image'] != null
        ? SingleImage.fromJson(json['single_image'])
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
    data['images'] = images;
    data['quantity'] = quantity;
    data['is_active'] = isActive;
    data['price'] = price;
    data['discount'] = discount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (singleImage != null) {
      data['single_image'] = singleImage!.toJson();
    }
    return data;
  }
}

class SingleImage {
  int? id;
  int? itemId;
  String? image;

  SingleImage({this.id, this.itemId, this.image});

  SingleImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemId = json['item_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['item_id'] = itemId;
    data['image'] = image;
    return data;
  }
}
