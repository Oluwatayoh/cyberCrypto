class UserData {
  String? createdAt;
  String? fullname;
  String? avatar;
  String? email;
  String? password;
  List<Wallet>? wallet;
  String? id;

  UserData(
      {this.createdAt,
      this.fullname,
      this.avatar,
      this.email,
      this.password,
      this.wallet,
      this.id});

  UserData.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    fullname = json['fullname'];
    avatar = json['avatar'];
    email = json['email'];
    password = json['password'];
    if (json['wallet'] != null) {
      wallet = <Wallet>[];
      json['wallet'].forEach((v) {
        wallet!.add(new Wallet.fromJson(v));
      });
    }
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['fullname'] = this.fullname;
    data['avatar'] = this.avatar;
    data['email'] = this.email;
    data['password'] = this.password;
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    return data;
  }
}

class Wallet {
  String? createdAt;
  String? accountName;
  String? accountAddress;
  double? balance;
  String? id;

  Wallet(
      {this.createdAt,
      this.accountName,
      this.accountAddress,
      this.balance,
      this.id});

  Wallet.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    accountName = json['accountName'];
    accountAddress = json['accountAddress'];
    balance = json['balance'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['accountName'] = this.accountName;
    data['accountAddress'] = this.accountAddress;
    data['balance'] = this.balance;
    data['id'] = this.id;
    return data;
  }
}
