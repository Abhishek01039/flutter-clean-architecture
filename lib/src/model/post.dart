class Post {
  Owner? owner;
  String? id;
  String? image;
  String? publishDate;
  String? text;
  List<String>? tags;
  String? link;
  int? likes;

  Post(
      {this.owner,
      this.id,
      this.image,
      this.publishDate,
      this.text,
      this.tags,
      this.link,
      this.likes});

  Post.fromJson(Map<String, dynamic> json) {
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    id = json['id'];
    image = json['image'];
    publishDate = json['publishDate'];
    text = json['text'];
    tags = json['tags'].cast<String>();
    link = json['link'];
    likes = json['likes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.owner != null) {
      data['owner'] = this.owner?.toJson();
    }
    data['id'] = this.id;
    data['image'] = this.image;
    data['publishDate'] = this.publishDate;
    data['text'] = this.text;
    data['tags'] = this.tags;
    data['link'] = this.link;
    data['likes'] = this.likes;
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

  Owner(
      {this.id,
      this.firstName,
      this.lastName,
      this.picture,
      this.title,
      this.email});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
    title = json['title'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['picture'] = this.picture;
    data['title'] = this.title;
    data['email'] = this.email;
    return data;
  }
}
