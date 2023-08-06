class Products {
  // int? id;
  double? price;
  String? title;
  String? image;
  Products({this.title, this.image});

  Products.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    title = json['title'];
    image = json['image'];
    price = double.parse(json['price'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    return data;
  }
}
