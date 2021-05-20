class Post {
  Owner? owner;
  String? id;
  String? image;
  String? publishDate;
  String? text;
  List<String>? tags;
  String? link;
  int? likes;

  Post({
    this.owner,
    this.id,
    this.image,
    this.publishDate,
    this.text,
    this.tags,
    this.link,
    this.likes,
  });

  Post.fromJson(Map<String, dynamic> json) {
    owner = json['owner'] != null
        ? Owner.fromJson(json['owner'] as Map<String, dynamic>)
        : null;
    id = json['id'] as String;
    image = json['image'] as String;
    publishDate = json['publishDate'] as String;
    text = json['text'] as String;
    tags = json['tags'].cast<String>() as List<String>;
    link = json['link'] as String;
    likes = json['likes'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (owner != null) {
      data['owner'] = owner?.toJson();
    }
    data['id'] = id;
    data['image'] = image;
    data['publishDate'] = publishDate;
    data['text'] = text;
    data['tags'] = tags;
    data['link'] = link;
    data['likes'] = likes;
    return data;
  }
}

class Owner {
  String? id;
  String? firstName;
  String? lastName;
  String? picture;
  String? title;
  String? email;

  Owner({
    this.id,
    this.firstName,
    this.lastName,
    this.picture,
    this.title,
    this.email,
  });

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    firstName = json['firstName'] as String;
    lastName = json['lastName'] as String;
    picture = json['picture'] as String;
    title = json['title'] as String;
    email = json['email'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['picture'] = picture;
    data['title'] = title;
    data['email'] = email;
    return data;
  }
}
