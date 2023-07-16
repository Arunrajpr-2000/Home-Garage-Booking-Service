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
  final bool ispending;
  final bool isaccepted;
  bool isadminapproved;
  final bool isworkstarted;
  String availabledate;
  String availabletime;
  String estimatedetails;
  String? workstartimage;
  String? workfinishimage;

  OrderModel(
      {required this.mainservicename,
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
      this.workfinishimage,
      this.workstartimage,
      required this.ispending,
      required this.isaccepted,
      required this.isworkstarted,
      required this.availabledate,
      required this.availabletime,
      required this.estimatedetails,
      required this.isadminapproved});

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
        'userimg': userimg,
        'ispending': ispending,
        'isaccepted': isaccepted,
        'isworkstarted': isworkstarted,
        'availabledate': availabledate,
        'availabletime': availabletime,
        'estimatedetails': estimatedetails,
        'isadminapproved': isadminapproved,
        'workfinishimage': workfinishimage,
        'workstartimage': workstartimage
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
        ispending: json['ispending'],
        userimg: json['userimg'],
        isaccepted: json['isaccepted'],
        isworkstarted: json['isworkstarted'],
        availabledate: json['availabledate'],
        availabletime: json['availabletime'],
        estimatedetails: json['estimatedetails'],
        isadminapproved: json['isadminapproved'],
        workfinishimage: json['workfinishimage'],
        workstartimage: json['workstartimage'],
      );
}
