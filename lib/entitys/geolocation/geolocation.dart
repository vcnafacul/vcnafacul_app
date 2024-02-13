import 'package:vcnafacul/enum/status_enum.dart';
import 'package:vcnafacul/types/card_dash/base_entity_card.dart';

class Geolocation extends BaseEntityCard {
  final double latitude;
  final double longitude;
  final String name;
  final String cep;
  final String state;
  final String city;
  final String neighborhood;
  final String street;
  final String number;
  final String complement;
  final String phone;
  final String whatsapp;
  final String email;
  final String? email2;
  final String category;
  final String site;
  final String linkedin;
  final String youtube;
  final String facebook;
  final String instagram;
  final String twitter;
  final String tiktok;
  final String userFullName;
  final String userPhone;
  final String userConnection;
  final String userEmail;
  final StatusEnum status;
  final String createdAt;
  final String? updatedAt;
  final String? deletedAt;

  Geolocation(
      {required super.id,
      required this.latitude,
      required this.longitude,
      required this.name,
      required this.cep,
      required this.state,
      required this.city,
      required this.neighborhood,
      required this.street,
      required this.number,
      required this.complement,
      required this.phone,
      required this.whatsapp,
      required this.email,
      this.email2,
      required this.category,
      required this.site,
      required this.linkedin,
      required this.youtube,
      required this.facebook,
      required this.instagram,
      required this.twitter,
      required this.tiktok,
      required this.userFullName,
      required this.userPhone,
      required this.userConnection,
      required this.userEmail,
      required this.status,
      required this.createdAt,
      this.updatedAt,
      this.deletedAt});

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    return Geolocation(
      id: json['id'].toString(),
      status: StatusEnum.values[json['status']],
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      latitude: json['latitude'] is int ? (json['latitude'] as int).toDouble() : json['latitude'] as double,
      longitude: json['longitude'] is int ? (json['longitude'] as int).toDouble() : json['longitude'] as double,
      name: json['name'] as String,
      cep: json['cep'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      neighborhood: json['neighborhood'] as String,
      street: json['street'] as String,
      number: json['number'] as String,
      complement: json['complement'] as String,
      phone: json['phone'] as String,
      whatsapp: json['whatsapp'] as String,
      email: json['email'] as String,
      email2: json['email2'] as String?,
      category: json['category'] as String,
      site: json['site'] as String,
      linkedin: json['linkedin'] as String,
      youtube: json['youtube'] as String,
      facebook: json['facebook'] as String,
      instagram: json['instagram'] as String,
      twitter: json['twitter'] as String,
      tiktok: json['tiktok'] as String,
      userFullName: json['userFullName'] as String,
      userPhone: json['userPhone'] as String,
      userConnection: json['userConnection'] as String,
      userEmail: json['userEmail'] as String,
    );
  }
}
