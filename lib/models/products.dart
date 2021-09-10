class Products {
  String? id;
  String? title;
  List<String>? images;
  String? source;
  List<String>? price;
  bool? isPriceMultiple;
  String? shopName;
  String? shopEmail;
  String? shopPhoneNumber;
  String? shopLogo;
  String? shopBio;
  String? picture;
  String? completeUrl;
  String? shopUrl;

  Products(
      {this.id,
      this.title,
      this.images,
      this.source,
      this.price,
      this.isPriceMultiple,
      this.shopName,
      this.shopEmail,
      this.shopPhoneNumber,
      this.shopLogo,
      this.shopBio,
      this.picture,
      this.completeUrl,
      this.shopUrl});

  factory Products.fromJson(json) => Products(
        id: json['id'] as String?,
        title: json['title'] as String?,
        images: (json['images'] as List)
            .map(
              (value) => value as String,
            )
            .toList(),
        source: json['source'] as String?,
        price: (json['price'] as List)
            .map(
              (value) => value as String,
            )
            .toList(),
        isPriceMultiple: json['is_price_multiple'] as bool?,
        shopName: json['shop_name'] as String?,
        shopEmail: json['shop_email'] as String?,
        shopPhoneNumber: json['shop_phone_number'] as String?,
        shopLogo: json['shop_logo'] as String?,
        shopBio: json['shop_bio'] as String?,
        picture: json['picture'] as String?,
        completeUrl: json['complete_url'] as String?,
        shopUrl: json['shop_url'] as String?,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['images'] = images;
    data['source'] = source;
    data['price'] = price;
    data['is_price_multiple'] = isPriceMultiple;
    data['shop_name'] = shopName;
    data['shop_email'] = shopEmail;
    data['shop_phone_number'] = shopPhoneNumber;
    data['shop_logo'] = shopLogo;
    data['shop_bio'] = shopBio;
    data['picture'] = picture;
    data['complete_url'] = completeUrl;
    data['shop_url'] = shopUrl;
    return data;
  }

  static List<Products> resolveList(List<dynamic>? data) {
    if (data == null) return [];
    final items = data.map((item) => Products.fromJson(item));
    return List<Products>.from(items);
  }
}
