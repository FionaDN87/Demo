class User{
  String email;
  String password;
  String displayName;
  String uid;

  User({
    this.email,
    this.password,
    this.displayName,
    this.uid,
    });

  Map<String, dynamic> serialize(){
    return <String,dynamic>{
      EMAIL: email,
      DISPLAYNAME: displayName,
      UID: uid
    };
  }

  static User deserialize (Map<String,dynamic> document){
    return User(
      email: document[EMAIL],
      displayName: document[DISPLAYNAME],
      uid: document[UID],

    );
  }

    static const PROFILE_COLLECION = 'userprofile';
    static const EMAIL = 'email';
    static const DISPLAYNAME = 'displayName';
    static const UID = 'uid';
}