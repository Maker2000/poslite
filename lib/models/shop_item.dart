import 'dart:convert';

ShopItem shopItemFromJson(String str) => ShopItem.fromJson(json.decode(str));

String shopItemToJson(ShopItem data) => json.encode(data.toJson());

class ShopItem {
  ShopItem({
    required this.name,
    required this.amount,
    required this.price,
  });

  String name;
  int amount;
  double price;

  ShopItem copyWith({
    String? name,
    int? amount,
    double? price,
  }) =>
      ShopItem(
        name: name ?? this.name,
        amount: amount ?? this.amount,
        price: price ?? this.price,
      );

  factory ShopItem.fromJson(Map<String, dynamic> json) => ShopItem(
        name: json["name"],
        amount: json["amount"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "amount": amount,
        "price": price,
      };
}
