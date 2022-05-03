class reservationModel{
  String ?name;
  String ? mail;
  String ?uId;
  String ?phone;
  String ? image;
  String ? bio;
  String ?cover;
  String ?date;
  String ?time;
  String ?title;
  reservationModel({
    this.name,
    this.mail,
    this.uId,
    this.phone,
    this.image,
    this.bio,
    this.cover,
    this.date,
    this.time,
    this.title,


  });
  reservationModel.fromJson(Map<String,dynamic>? json){
    mail = json!['mail'];
    name=json['name'];
    uId=json['uId'];
    phone=json['phone'];
    image=json['image'];
    bio=json['bio'];
    cover=json['cover'];
    date=json['date'];
    time=json['time'];
    title=json['title'];


  }
  Map<String,dynamic>toMap(){
    return {
      'name': name,
      'mail': mail,
      'uId': uId,
      'image':image,
      'cover':cover,
      'bio':bio,
      'phone': phone,
      'date': date,
      'time': time,
      'title': title,

    };
  }
}