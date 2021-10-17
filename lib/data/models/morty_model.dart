class MortyModel {
  MortyInfo? info;
  List<Character> characters = [];

  MortyModel.fromJson(Map<String, dynamic> map) {
    // ignore: avoid_print
    print((map['results'] as List<dynamic>).length);

    info = MortyInfo.fromJson(map['info']);
    for (Map<String, dynamic> character in (map['results'] as List<dynamic>)) {
      characters.add(Character.fromJson(character));
    }
  }
}

class MortyInfo {
  int count = 0;
  int pages = 0;
  String? next;
  String? prev;

  MortyInfo.fromJson(Map<String, dynamic> map) {
    count = map['count'];
    pages = map['pages'];
    next = map['next'];
    prev = map['prev'];
  }
}

class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? gender;
  Origin? origin;
  Location? location;
  String? image;
  List<String?> episode = [];
  String? url;
  String? created;

  Character.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    status = map['status'];
    species = map['species'];
    gender = map['gender'];
    origin = Origin.fromJson(map['origin']);
    location = Location.fromJson(map['location']);
    image = map['image'];
    episode = (map['episode'] as List<dynamic>).map((e) {
      return e.toString();
    }).toList();
    url = map['url'];
    created = map['created'];
  }
}

class Origin {
  String? name;
  String? url;

  Origin.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    url = map['url'];
  }
}

class Location {
  String? name;
  String? url;

  Location.fromJson(Map<String, dynamic> map) {
    name = map['name'];
    url = map['url'];
  }
}
