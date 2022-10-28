class Welcome {
  List<Mods>? mods;

  Welcome({this.mods});

  Welcome.fromJson(Map<String, dynamic> json) {
    if (json['Mods'] != null) {
      mods = <Mods>[];
      json['Mods'].forEach((v) {
        mods!.add(new Mods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mods != null) {
      data['Mods'] = this.mods!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Mods {
  String? name;
  String? logo;
  String? mainimage;
  String? title;
  String? poet;
  List<String>? soundsimage;
  List<String>? listening;
  List<String>? soundsname;
  List<String>? soundspath;

  Mods(
      {this.name,
        this.logo,
        this.mainimage,
        this.title,
        this.poet,
        this.soundsimage,
        this.listening,
        this.soundsname,
        this.soundspath});

  Mods.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    logo = json['logo'];
    mainimage = json['mainimage'];
    title = json['title'];
    poet = json['poet'];
    soundsimage = json['soundsimage'].cast<String>();
    listening = json['listening'].cast<String>();
    soundsname = json['soundsname'].cast<String>();
    soundspath = json['soundspath'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['mainimage'] = this.mainimage;
    data['title'] = this.title;
    data['poet'] = this.poet;
    data['soundsimage'] = this.soundsimage;
    data['listening'] = this.listening;
    data['soundsname'] = this.soundsname;
    data['soundspath'] = this.soundspath;
    return data;
  }
}
