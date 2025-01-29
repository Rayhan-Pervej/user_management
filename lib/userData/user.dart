class User {
  final int id;
  final String name;
  final String email;
  String avatarUrl;
  final String phone;
  final String address;
  final String company;

  User(
      {required this.id,
      required this.name,
      required this.email,
      this.avatarUrl = '',
      this.phone = '',
      this.address = '',
      this.company = ''});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address']['city'],
      company: json['company']['name'],
    );
  }
}
