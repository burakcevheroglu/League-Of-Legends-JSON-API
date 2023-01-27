import 'dart:core';

class Champion {
  final String version;
  final String id;
  final String key;
  final String name;
  final String title;
  final String blurb;
  final Info info;
  final Image image;
  final List<dynamic> tags;
  final String partype;
  final Stats stats;

  Champion(
      {required this.version,
      required this.id,
      required this.key,
      required this.name,
      required this.title,
      required this.blurb,
      required this.info,
      required this.image,
      required this.tags,
      required this.partype,
      required this.stats});

  factory Champion.fromJson(Map<String, dynamic> jsonData, dynamic key) {
    return Champion(
      version: jsonData['data'][key]['version'],
      id: jsonData['data'][key]['id'],
      key: jsonData['data'][key]['key'],
      name: jsonData['data'][key]['name'],
      title: jsonData['data'][key]['title'],
      blurb: jsonData['data'][key]['blurb'],
      info: Info.fromJson(jsonData, key),
      image: Image.fromJson(jsonData, key),
      tags: jsonData['data'][key]['tags'],
      partype: jsonData['data'][key]['partype'],
      stats: Stats.fromJson(jsonData, key),
    );
  }
}

class Info {
  final int attack;
  final int defense;
  final int magic;
  final int difficulty;

  Info(
      {required this.attack,
      required this.defense,
      required this.magic,
      required this.difficulty});

  factory Info.fromJson(Map<String, dynamic> jsonData, dynamic key){
    return Info(
      attack: jsonData['data'][key]['info']['attack'],
      defense: jsonData['data'][key]['info']['defense'],
      magic: jsonData['data'][key]['info']['magic'],
      difficulty: jsonData['data'][key]['info']['difficulty'],
    );
  }
}

class Image {
  final String full;
  final String sprite;
  final String group;
  final int x;
  final int y;
  final int w;
  final int h;

  Image(
      {required this.full,
      required this.sprite,
      required this.group,
      required this.x,
      required this.y,
      required this.w,
      required this.h});

  factory Image.fromJson(Map<String, dynamic> jsonData, dynamic key){
    return Image(
      full: jsonData['data'][key]['image']['full'],
      sprite: jsonData['data'][key]['image']['sprite'],
      group: jsonData['data'][key]['image']['group'],
      x: jsonData['data'][key]['image']['x'],
      y: jsonData['data'][key]['image']['y'],
      w: jsonData['data'][key]['image']['w'],
      h: jsonData['data'][key]['image']['h'],
    );
  }
}

class Stats {
  final num hp;
  final num hpperlevel;
  final num mp;
  final num mpperlevel;
  final num movespeed;
  final num armor;
  final num armorperlevel;
  final num spellblock;
  final num spellblockperlevel;
  final num attackrange;
  final num hpregen;
  final num hpregenperlevel;
  final num mpregen;
  final num mpregenperlevel;
  final num crit;
  final num critperlevel;
  final num attackdamage;
  final num attackdamageperlevel;
  final num attackspeedperlevel;
  final num attackspeed;

  Stats(
      {required this.hp,
      required this.hpperlevel,
      required this.mp,
      required this.mpperlevel,
      required this.movespeed,
      required this.armor,
      required this.armorperlevel,
      required this.spellblock,
      required this.spellblockperlevel,
      required this.attackrange,
      required this.hpregen,
      required this.hpregenperlevel,
      required this.mpregen,
      required this.mpregenperlevel,
      required this.crit,
      required this.critperlevel,
      required this.attackdamage,
      required this.attackdamageperlevel,
      required this.attackspeedperlevel,
      required this.attackspeed});

  factory Stats.fromJson(Map<String, dynamic> jsonData, dynamic key){
    return Stats(
      hp: jsonData['data'][key]['stats']['hp'],
      hpperlevel: jsonData['data'][key]['stats']['hpperlevel'],
      mp: jsonData['data'][key]['stats']['mp'],
      mpperlevel: jsonData['data'][key]['stats']['mpperlevel'],
      movespeed: jsonData['data'][key]['stats']['movespeed'],
      armor: jsonData['data'][key]['stats']['armor'],
      armorperlevel: jsonData['data'][key]['stats']['armorperlevel'],
      spellblock: jsonData['data'][key]['stats']['spellblock'],
      spellblockperlevel: jsonData['data'][key]['stats']['spellblockperlevel'],
      attackrange: jsonData['data'][key]['stats']['attackrange'],
      hpregen: jsonData['data'][key]['stats']['hpregen'],
      hpregenperlevel: jsonData['data'][key]['stats']['hpregenperlevel'],
      mpregen: jsonData['data'][key]['stats']['mpregen'],
      mpregenperlevel: jsonData['data'][key]['stats']['mpregenperlevel'],
      crit: jsonData['data'][key]['stats']['crit'],
      critperlevel: jsonData['data'][key]['stats']['critperlevel'],
      attackdamage: jsonData['data'][key]['stats']['attackdamage'],
      attackdamageperlevel: jsonData['data'][key]['stats']['attackdamageperlevel'],
      attackspeedperlevel: jsonData['data'][key]['stats']['attackspeedperlevel'],
      attackspeed: jsonData['data'][key]['stats']['attackspeed'],
    );
  }
}