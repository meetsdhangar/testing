// To parse this JSON data, do
//
//     final productmodel = productmodelFromMap(jsonString);

import 'dart:convert';

Productmodel productmodelFromMap(String str) => Productmodel.fromMap(json.decode(str));

String productmodelToMap(Productmodel data) => json.encode(data.toMap());

class Productmodel {
    List<Product> products;
    int total;
    int skip;
    int limit;

    Productmodel({
        required this.products,
        required this.total,
        required this.skip,
        required this.limit,
    });

    factory Productmodel.fromMap(Map<String, dynamic> json) => Productmodel(
        products: List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toMap() => {
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Product {
    int id;
    String title;
    String description;
    int price;
    double discountPercentage;
    double rating;
    int stock;
    String brand;
    String category;
    String thumbnail;
    List<String> images;

    Product({
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.brand,
        required this.category,
        required this.thumbnail,
        required this.images,
    });

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
