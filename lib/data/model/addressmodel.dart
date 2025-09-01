class AddressModel {
  int? id;
  int? userId;
  String? city;
  String? neighborhood;
  String? street;
  String? contactPhone;
  String? addressName;
  String? building;
  String? apartment;
  double? latitude;
  double? longitude;
  int? postalCode;

  AddressModel(
      {id,
      userId,
      city,
      neighborhood,
      street,
      contactPhone,
      addressName,
      building,
      apartment,
      latitude,
      longitude,
      postalCode});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    city = json['city'];
    neighborhood = json['neighborhood'];
    street = json['street'];
    contactPhone = json['contact_phone'];
    addressName = json['address_name'];
    building = json['building'];
    apartment = json['apartment'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    postalCode = json['postal_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['city'] = city;
    data['neighborhood'] = neighborhood;
    data['street'] = street;
    data['contact_phone'] = contactPhone;
    data['address_name'] = addressName;
    data['building'] = building;
    data['apartment'] = apartment;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['postal_code'] = postalCode;
    return data;
  }
}
