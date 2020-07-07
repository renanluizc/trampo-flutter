import 'dart:convert';

class JobModel {
  final String uid;
  final String name;
  final String description;
  final num price;

  JobModel({
    this.uid,
    this.name,
    this.description,
    this.price,
  });

  JobModel copyWith({
    String uid,
    String name,
    String description,
    num price,
  }) {
    return JobModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'description': description,
      'price': price,
    };
  }

  static JobModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return JobModel(
      uid: map['uid'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  static JobModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'JobModel(uid: $uid, name: $name, description: $description, price: $price)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is JobModel &&
        o.uid == uid &&
        o.name == name &&
        o.description == description &&
        o.price == price;
  }

  @override
  int get hashCode {
    return uid.hashCode ^ name.hashCode ^ description.hashCode ^ price.hashCode;
  }
}
