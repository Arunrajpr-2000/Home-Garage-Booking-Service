class OrderModel {
  final String mainservicename;
  final String specificservicename;
  final String price;
  final String orderid;
  final bool isDelivered;
  final bool isCanceled;
  String datetime;
  final String paymentmethod;
  final String? address;
  final String userphonenumber;
  final String? username;
  final String? nearby;
  final String? userimg;
  OrderModel({
    required this.mainservicename,
    required this.specificservicename,
    required this.price,
    required this.orderid,
    required this.isDelivered,
    required this.isCanceled,
    required this.datetime,
    required this.paymentmethod,
    this.address,
    required this.userphonenumber,
    this.username,
    this.nearby,
    this.userimg,
  });

  Map<String, dynamic> toJson() => {
        'orderid': orderid,
        'mainservicename': mainservicename,
        'specificservicename': specificservicename,
        'price': price,
        'isDelivered': isDelivered,
        "isCanceled": isCanceled,
        'datetime': datetime,
        'paymentmethod': paymentmethod,
        'address': address,
        'userphonenumber': userphonenumber,
        'username': username,
        'nearby': nearby,
        'userimg': userimg
      };

  static OrderModel fromJson(Map<String, dynamic> json) => OrderModel(
        orderid: json['orderid'],
        mainservicename: json['mainservicename'],
        specificservicename: json['specificservicename'],
        price: json['price'],
        isDelivered: json['isDelivered'],
        isCanceled: json['isCanceled'],
        datetime: json['datetime'],
        address: json['address'],
        paymentmethod: json['paymentmethod'],
        userphonenumber: json['userphonenumber'],
        username: json['username'],
        nearby: json['nearby'],
        userimg: json['userimg'],
      );
}
