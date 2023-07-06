class ServiceModel {
  final String mainservicename;
  final String specificservicename;

  final String price;
  final String backgroundImg;
  final String imgsubheading;
  final String? cartImg;
  final String description;

  ServiceModel({
    required this.mainservicename,
    required this.specificservicename,
    required this.price,
    required this.backgroundImg,
    this.cartImg,
    required this.description,
    required this.imgsubheading,
  });
  Map<String, dynamic> toJson() => {
        'mainservicename': mainservicename,
        'price': price,
        'specificservicename': specificservicename,
        'backgroundImg': backgroundImg,
        'cartImg': cartImg,
        'imgsubheading': imgsubheading,
        'description': description,
      };

  static ServiceModel fromJson(Map<String, dynamic> json) => ServiceModel(
        backgroundImg: json["backgroundImg"],
        cartImg: json["cartImg"],
        imgsubheading: json["imgsubheading"],
        description: json['description'],
        mainservicename: json['mainservicename'],
        price: json['price'],
        specificservicename: json['specificservicename'],
      );
}
