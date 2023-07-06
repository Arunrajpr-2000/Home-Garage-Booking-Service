class ProfileModel {
  final String? username;

  final String? email;

  final String? image;
  final String? street;
  final String? cityordistrict;
  final String? state;
  final String? nearby;
  final String phonenumber;
  final String? postalcode;

  ProfileModel(
      {this.username,
      this.email,
      required this.phonenumber,
      this.image,
      this.postalcode,
      this.street,
      this.state,
      this.cityordistrict,
      this.nearby});
  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'street': street,
        'phonenumber': phonenumber,
        'postalcode': postalcode,
        'image': image,
        'cityordistrict': cityordistrict,
        'state': state,
        'nearby': nearby
      };

  static ProfileModel fromJson(Map<String, dynamic> json) => ProfileModel(
      username: json['username'],
      email: json['email'],
      street: json['street'],
      phonenumber: json['phonenumber'],
      postalcode: json['postalcode'],
      image: json['image'],
      cityordistrict: json['cityordistrict'],
      state: json['state'],
      nearby: json['nearby']);
}
