import 'package:objectbox/objectbox.dart';

import 'local_image_url_data.dart';

@Entity()
class LocalUserData {
  LocalUserData({
    this.id,
    this.email,
    this.password,
    this.name,
    this.roleType,
  });

  @Id()
  int? id;
  String? email;
  String? password;
  String? name;
  int? roleType;

  final avatar = ToOne<LocalImageUrlData>();
  final photos = ToMany<LocalImageUrlData>();

  @override
  int get hashCode {
    return id.hashCode ^ email.hashCode ^ password.hashCode ^ name.hashCode ^ roleType.hashCode;
  }

  @override
  String toString() {
    return 'LocalUserData(id: $id, email: $email, money: $password, gender: $name, birthday: $roleType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is LocalUserData &&
        other.id == id &&
        other.email == email &&
        other.password == password &&
        other.name == name &&
        other.roleType == roleType;
  }
}
