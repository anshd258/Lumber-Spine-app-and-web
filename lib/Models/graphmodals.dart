class GraphDataModal {
  Data? data;

  GraphDataModal({this.data});

  GraphDataModal.fromJson(Map<String, dynamic> json) {
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
  List<double>? rawPeakX;
  List<double>? rawPeakY;
  List<double>? rawPeakZ;
  List<String>? rawTimeX;
  List<String>? rawTimeY;
  List<String>? rawTimeZ;
  double? se;
  double? sed;

  Data(
      {this.r,
      this.rawPeakX,
      this.rawPeakY,
      this.rawPeakZ,
      this.rawTimeX,
      this.rawTimeY,
      this.rawTimeZ,
      this.se,
      this.sed});

  Data.fromJson(Map<String, dynamic> json) {
    r = json['r'];
    rawPeakX = json['raw_peak_x'].cast<double>();
    rawPeakY = json['raw_peak_y'].cast<double>();
    rawPeakZ = json['raw_peak_z'].cast<double>();
    rawTimeX = json['raw_time_x'].cast<String>();
    rawTimeY = json['raw_time_y'].cast<String>();
    rawTimeZ = json['raw_time_z'].cast<String>();
    se = json['se'];
    sed = json['sed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['r'] = this.r;
    data['raw_peak_x'] = this.rawPeakX;
    data['raw_peak_y'] = this.rawPeakY;
    data['raw_peak_z'] = this.rawPeakZ;
    data['raw_time_x'] = this.rawTimeX;
    data['raw_time_y'] = this.rawTimeY;
    data['raw_time_z'] = this.rawTimeZ;
    data['se'] = this.se;
    data['sed'] = this.sed;
    return data;
  }
}
