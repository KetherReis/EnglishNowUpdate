import 'dart:convert';

class Friend {
  String? id;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? experience;
  String? about;
  String? avatar;
  double? rating;
  int? price; //You can set price in future to call and messages per user :)
  int? idSpeciality;
  int? goodReviews;
  int? totaScore;
  int? satisfaction;
  int? callDuration;

  Friend({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.experience,
    this.about,
    this.avatar,
    this.rating,
    this.price,
    this.idSpeciality,
    this.goodReviews,
    this.totaScore,
    this.satisfaction,
    this.callDuration,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'experience': experience,
      'about': about,
      'avatar': avatar,
      'rating': rating,
      'price': price,
      'idSpeciality': idSpeciality,
      'goodReviews': goodReviews,
      'totaScore': totaScore,
      'satisfaction': satisfaction,
      'callDuration': callDuration,
    };
  }

  factory Friend.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Friend();

    return Friend(
      id: map['id'],
      name: map['name'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      phone: map['phone'],
      experience: map['experience'],
      about: map['about'],
      avatar: map['avatar'],
      rating: map['rating'],
      price: map['price'],
      idSpeciality: map['idSpeciality'],
      goodReviews: map['goodReviews'],
      totaScore: map['totaScore'],
      satisfaction: map['satisfaction'],
      callDuration: map['callDuration'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Friend.fromJson(String source) => Friend.fromMap(json.decode(source));
}

class Doctors {
  List<Friend>? friendList;

  Doctors({this.friendList});

  factory Doctors.fromJSON(Map<dynamic, dynamic> json) {
    return Doctors(friendList: parserecipes(json));
  }

  static List<Friend> parserecipes(friendJSON) {
    var dList = friendJSON['friends'] as List;
    List<Friend> friendList =
        dList.map((data) => Friend.fromJson(data)).toList();
    return friendList;
  }
}

final friends = [
  Friend(
    name: 'Carlos Borges',
    experience: 'Iniciante',
    about:
        'Conheço algumas palavras, mas não consigo formar frases',
    avatar: 'assets/images/user_1.png',
    rating: 4.5,
    price: 100,
  ),
  Friend(
    name: 'Helena Hubbard',
    experience: 'Intermediário',
    about:
        'Disponível para conversas no chat',
    avatar: 'assets/images/user_2.png',
    rating: 4.7,
    price: 90,
  ),
  Friend(
    name: 'Alaor Suez',
    experience: 'Avançado',
    about:
        'Fluente. Disponível para chamada de vídeo e chat',
    avatar: 'assets/images/user_3.png',
    rating: 4.3,
    price: 100,
  ),
  Friend(
    name: 'Gabriel Moreira',
    experience: 'Nativo',
    about:
        'Born in the UK and looking for someone to talk to.',
    avatar: 'assets/images/user_4.png',
    rating: 4.7,
    price: 100,
  ),
  Friend(
    name: 'Luan Silva',
    experience: 'Professor',
    about:
        'Lecionando aulas há 10 anos!',
    avatar: 'assets/images/user_5.png',
    rating: 4.7,
    price: 100,
  ),
];
