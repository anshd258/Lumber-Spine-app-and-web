class HistoryModal {
  List<Val>? val;

  HistoryModal({this.val});

  HistoryModal.fromJson(List json) {
    
      val = <Val>[];
      json.forEach((v) {
        val!.add(new Val.fromJson(v));
      });
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.val != null) {
      data['val'] = this.val!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Val {
  Data? data;

  Val({this.data});

  Val.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  double? time;
  String? filename;
  double? r;
  double? sed;

  Data({this.time, this.filename, this.r, this.sed});

  Data.fromJson(Map<String, dynamic> json) {
    time = json['Time'];
    filename = json['filename'];
    r = json['r'];
    sed = json['sed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Time'] = this.time;
    data['filename'] = this.filename;
    data['r'] = this.r;
    data['sed'] = this.sed;
    return data;
  }
}
