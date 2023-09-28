class ResponseGraphModal {
  Data? data;

  ResponseGraphModal({this.data});

  ResponseGraphModal.fromJson(Map<String, dynamic> json) {
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
  double? r;
  double? rawMaxNeg;
  double? rawMaxPos;
  double? rawNegX;
  double? rawNegY;
  double? rawNegZ;
  List<double>? rawPeakX;
  List<double>? rawPeakY;
  List<double>? rawPeakZ;
  double? rawPosX;
  double? rawPosY;
  double? rawPosZ;
  List<String>? rawTimeX;
  List<String>? rawTimeY;
  List<String>? rawTimeZ;
  double? se;
  double? sed;
  String? dx;
  String? dy;
  String? dz;
  String? dxd;
  String? dyd;
  String? dzd;

  Data(
      {this.r,
      this.rawMaxNeg,
      this.rawMaxPos,
      this.rawNegX,
      this.rawNegY,
      this.rawNegZ,
      this.rawPeakX,
      this.rawPeakY,
      this.rawPeakZ,
      this.rawPosX,
      this.rawPosY,
      this.rawPosZ,
      this.rawTimeX,
      this.rawTimeY,
      this.rawTimeZ,
      this.se,
      this.sed,
      this.dx,
      this.dy,
      this.dz,
      this.dxd,
      this.dyd,
      this.dzd});

  Data.fromJson(Map<String, dynamic> json) {
    r = json['r'];
    rawMaxNeg = json['raw_max_neg'];
    rawMaxPos = json['raw_max_pos'];
    rawNegX = json['raw_neg_x'];
    rawNegY = json['raw_neg_y'];
    rawNegZ = json['raw_neg_z'];
    rawPeakX = json['raw_peak_x'].cast<double>();
    rawPeakY = json['raw_peak_y'].cast<double>();
    rawPeakZ = json['raw_peak_z'].cast<double>();
    rawPosX = json['raw_pos_x'];
    rawPosY = json['raw_pos_y'];
    rawPosZ = json['raw_pos_z'];
    rawTimeX = json['raw_time_x'].cast<String>();
    rawTimeY = json['raw_time_y'].cast<String>();
    rawTimeZ = json['raw_time_z'].cast<String>();
    se = json['se'];
    sed = json['sed'];
    dx = json["dx"];
    dy = json["dy"];
    dz = json["dx"];
    dxd = json["dxd"];
    dyd = json["dyd"];
    dzd = json["dzd"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['r'] = this.r;
    data['raw_max_neg'] = this.rawMaxNeg;
    data['raw_max_pos'] = this.rawMaxPos;
    data['raw_neg_x'] = this.rawNegX;
    data['raw_neg_y'] = this.rawNegY;
    data['raw_neg_z'] = this.rawNegZ;
    data['raw_peak_x'] = this.rawPeakX;
    data['raw_peak_y'] = this.rawPeakY;
    data['raw_peak_z'] = this.rawPeakZ;
    data['raw_pos_x'] = this.rawPosX;
    data['raw_pos_y'] = this.rawPosY;
    data['raw_pos_z'] = this.rawPosZ;
    data['raw_time_x'] = this.rawTimeX;
    data['raw_time_y'] = this.rawTimeY;
    data['raw_time_z'] = this.rawTimeZ;
    data['se'] = this.se;
    data['sed'] = this.sed;
    return data;
  }
}
