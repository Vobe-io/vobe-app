class Owner {
    String id;
    String email;
    bool emailVerified;
    String password;
    String username;
    bool verified;

    Owner({this.id, this.email, this.emailVerified, this.password, this.username, this.verified});

    factory Owner.fromJson(Map<String, dynamic> json) {
        return Owner(
            id: json['_id'],
            email: json['email'], 
            emailVerified: json['emailVerified'], 
            password: json['password'], 
            username: json['username'], 
            verified: json['verified'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['_id'] = this.id;
        data['email'] = this.email;
        data['emailVerified'] = this.emailVerified;
        data['password'] = this.password;
        data['username'] = this.username;
        data['verified'] = this.verified;
        return data;
    }
}