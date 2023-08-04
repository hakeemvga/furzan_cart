class UserModel {
  UserModel({
      this.tokens, 
      this.user,});

  UserModel.fromJson(dynamic json) {
    tokens = json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  Tokens? tokens;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (tokens != null) {
      map['tokens'] = tokens?.toJson();
    }
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.username, 
      this.email, 
      this.phone, 
      this.role, 
      this.blocked, 
      this.verified, 
      this.refreshToken, 
      this.referralCode, 
      this.walletBalance, 
      this.shop,});

  User.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    blocked = json['blocked'];
    verified = json['verified'];
    refreshToken = json['refreshToken'];
    referralCode = json['referralCode'];
    walletBalance = json['walletBalance'];
    shop = json['Shop'] != null ? Shop.fromJson(json['Shop']) : null;
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? username;
  String? email;
  String? phone;
  String? role;
  bool? blocked;
  bool? verified;
  dynamic refreshToken;
  dynamic referralCode;
  dynamic walletBalance;
  Shop? shop;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['username'] = username;
    map['email'] = email;
    map['phone'] = phone;
    map['role'] = role;
    map['blocked'] = blocked;
    map['verified'] = verified;
    map['refreshToken'] = refreshToken;
    map['referralCode'] = referralCode;
    map['walletBalance'] = walletBalance;
    if (shop != null) {
      map['Shop'] = shop?.toJson();
    }
    return map;
  }

}

class Shop {
  Shop({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.shopName, 
      this.shopEmail, 
      this.shopContact, 
      this.userId,});

  Shop.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    shopName = json['shopName'];
    shopEmail = json['shopEmail'];
    shopContact = json['shopContact'];
    userId = json['userId'];
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? shopName;
  String? shopEmail;
  String? shopContact;
  String? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['shopName'] = shopName;
    map['shopEmail'] = shopEmail;
    map['shopContact'] = shopContact;
    map['userId'] = userId;
    return map;
  }

}

class Tokens {
  Tokens({
      this.accessToken, 
      this.refreshToken,});

  Tokens.fromJson(dynamic json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }
  String? accessToken;
  String? refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['refresh_token'] = refreshToken;
    return map;
  }

}