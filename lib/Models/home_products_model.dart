class HomeModel {
  bool? status;
  DataModel? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? DataModel.fromJson(json['data']) : null;
  }
}


class DataModel {
  List<ProductsModel> products = [];
  List<BannersModel> banners = [];

  DataModel.fromJson(Map<String, dynamic> json) {
    json['products'].forEach((element) {
      products.add(ProductsModel.fromJson(element));
    });
    json['banners'].forEach((element) {
      banners.add(BannersModel.fromJson(element));
    });
  }
}


class BannersModel {
  int? id;
  String? image;
  // String? category;

  BannersModel({
    this.id,
    this.image,
    // this.category,

  });

  BannersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    // category = json['category'];
  }
}


class ProductsModel {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;
  bool? inFavorites;
  bool? inCart;

  ProductsModel({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.inFavorites,
    this.inCart,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}