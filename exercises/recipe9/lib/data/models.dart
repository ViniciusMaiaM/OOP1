class Beer {
  String name, style, ibu;

  Beer.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? '',
        style = json['style'] ?? '',
        ibu = json['ibu'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;

    data['style'] = style;

    data['ibu'] = ibu;

    return data;
  }

  void copy(Map<String, dynamic> json) {
    name = json['name'] ?? name;

    style = json['style'] ?? style;

    ibu = json['ibu'] ?? ibu;
  }

  dynamic operator [](String property) {
    switch (property) {
      case 'name':
        return name;
      case 'style':
        return style;
      case 'ibu':
        return ibu;
      default:
        throw ArgumentError('Invalid property: $property');
    }
  }

  Beer({required this.name, required this.style, required this.ibu});
}

class Coffee {
  String blendName, origin, variety;

  Coffee({this.blendName = '', this.origin = '', this.variety = ''});

  Coffee.fromJson(Map<String, dynamic> json)
      : blendName = json['blend_name'] ?? '',
        origin = json['origin'] ?? '',
        variety = json['variety'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['blend_name'] = blendName;

    data['origin'] = origin;

    data['variety'] = variety;

    return data;
  }

  void copy(Map<String, dynamic> json) {
    blendName = json['blend_name'] ?? blendName;

    origin = json['origin'] ?? origin;

    variety = json['variety'] ?? variety;
  }

  dynamic operator [](String property) {
    switch (property) {
      case 'blend_name':
        return blendName;
      case 'origin':
        return origin;
      case 'variety':
        return variety;
      default:
        throw ArgumentError('Invalid property: $property');
    }
  }
}

class Nation {
  String nationality, capital, language, nationalSport;

  Nation(
      {this.nationality = '',
      this.capital = '',
      this.language = '',
      this.nationalSport = ''});

  Nation.fromJson(Map<String, dynamic> json)
      : nationality = json['nationality'] ?? '',
        capital = json['capital'] ?? '',
        language = json['language'] ?? '',
        nationalSport = json['national_sport'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['nationality'] = nationality;

    data['capital'] = capital;

    data['language'] = language;

    data['national_sport'] = nationalSport;

    return data;
  }

  void copy(Map<String, dynamic> json) {
    nationality = json['nationality'] ?? nationality;

    capital = json['capital'] ?? capital;

    language = json['language'] ?? language;

    nationalSport = json['national_sport'] ?? nationalSport;
  }

  dynamic operator [](String property) {
    switch (property) {
      case 'nationality':
        return nationality;
      case 'capital':
        return capital;
      case 'language':
        return language;
      case 'national_sport':
        return nationalSport;
      default:
        throw ArgumentError('Invalid property: $property');
    }
  }
}

class Cannabis {
  String strain;
  String health_benefit;
  String category;

  Cannabis({
    this.strain = '',
    this.health_benefit = '',
    this.category = '',
  });

  Cannabis.fromJson(Map<String, dynamic> json)
      : strain = json['strain'] ?? '',
        health_benefit = json['health_benefit'] ?? '',
        category = json['category'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['strain'] = strain;
    data['health_benefit'] = health_benefit;
    data['category'] = category;

    return data;
  }

  void copy(Map<String, dynamic> json) {
    strain = json['strain'] ?? strain;
    health_benefit = json['health_benefit'] ?? health_benefit;
    category = json['category'] ?? category;
  }

  dynamic operator [](String property) {
    switch (property) {
      case 'strain':
        return strain;
      case 'health_benefit':
        return health_benefit;
      case 'category':
        return category;
      default:
        throw ArgumentError('Invalid property: $property');
    }
  }
}
