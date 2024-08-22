
class UserInfoAuth {
  var id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? birthDate;
  int? registered;
  int? verified;
  String? accessToken;
  String? refreshToken;


  UserInfoAuth(
      {
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.mobile,
        this.birthDate,
        this.registered,
        this.verified,
        this.accessToken,
        this.refreshToken
      });

  UserInfoAuth.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    birthDate = json['birth_date'];
    registered = json['registered'];
    verified = json['verified'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['birth_date'] = birthDate;
    data['registered'] = registered;
    data['verified'] = verified;
    data['refresh_token'] = refreshToken;
    data['access_token'] = accessToken;
    return data;
  }
}
