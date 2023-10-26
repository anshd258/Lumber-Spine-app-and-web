class ResponseGraphModal {
  Aw? aw;
  AwNew? awNew;
  Data? data;
  Ft? ft;
  VdvValues? vdvValues;

  ResponseGraphModal({this.aw, this.awNew, this.data, this.ft, this.vdvValues});

  ResponseGraphModal.fromJson(Map<String, dynamic> json) {
    aw = json['aw'] != null ? new Aw.fromJson(json['aw']) : null;
    awNew = json['aw_new'] != null ? new AwNew.fromJson(json['aw_new']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    ft = json['ft'] != null ? new Ft.fromJson(json['ft']) : null;
    vdvValues = json['vdv_values'] != null
        ? new VdvValues.fromJson(json['vdv_values'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aw != null) {
      data['aw'] = this.aw!.toJson();
    }
    if (this.awNew != null) {
      data['aw_new'] = this.awNew!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.ft != null) {
      data['ft'] = this.ft!.toJson();
    }
    if (this.vdvValues != null) {
      data['vdv_values'] = this.vdvValues!.toJson();
    }
    return data;
  }
}

class Aw {
  double? aw;

  Aw({this.aw});

  Aw.fromJson(Map<String, dynamic> json) {
    aw = json['aw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aw'] = this.aw;
    return data;
  }
}

class AwNew {
  List<int>? awXnew;
  List<int>? awYnew;
  List<int>? awZnew;
  double? awx;
  double? awy;
  double? awz;

  AwNew({this.awXnew, this.awYnew, this.awZnew, this.awx, this.awy, this.awz});

  AwNew.fromJson(Map<String, dynamic> json) {
    awXnew = json['aw_Xnew'].cast<int>();
    awYnew = json['aw_Ynew'].cast<int>();
    awZnew = json['aw_Znew'].cast<int>();
    awx = json['awx'];
    awy = json['awy'];
    awz = json['awz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aw_Xnew'] = this.awXnew;
    data['aw_Ynew'] = this.awYnew;
    data['aw_Znew'] = this.awZnew;
    data['awx'] = this.awx;
    data['awy'] = this.awy;
    data['awz'] = this.awz;
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
      this.sed});

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

class Ft {
  Amp? amp;
  Frequency? frequency;
  Magnitude? magnitude;

  Ft({this.amp, this.frequency, this.magnitude});

  Ft.fromJson(Map<String, dynamic> json) {
    amp = json['Amp'] != null ? new Amp.fromJson(json['Amp']) : null;
    frequency = json['Frequency'] != null
        ? new Frequency.fromJson(json['Frequency'])
        : null;
    magnitude = json['Magnitude'] != null
        ? new Magnitude.fromJson(json['Magnitude'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.amp != null) {
      data['Amp'] = this.amp!.toJson();
    }
    if (this.frequency != null) {
      data['Frequency'] = this.frequency!.toJson();
    }
    if (this.magnitude != null) {
      data['Magnitude'] = this.magnitude!.toJson();
    }
    return data;
  }
}

class Amp {
  List<double>? proto1Unfiltered;
  List<double>? ref1Unfiltered;
  List<double>? time;

  Amp({this.proto1Unfiltered, this.ref1Unfiltered, this.time});

  Amp.fromJson(Map<String, dynamic> json) {
    proto1Unfiltered = json['proto1_unfiltered'].cast<double>();
    ref1Unfiltered = json['ref1_unfiltered'].cast<double>();
    time = json['time'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['proto1_unfiltered'] = this.proto1Unfiltered;
    data['ref1_unfiltered'] = this.ref1Unfiltered;
    data['time'] = this.time;
    return data;
  }
}

class Frequency {
  List<double>? fPsd;
  List<double>? psdProto1Unfiltered;
  List<double>? psdRef1Unfiltered;

  Frequency({this.fPsd, this.psdProto1Unfiltered, this.psdRef1Unfiltered});

  Frequency.fromJson(Map<String, dynamic> json) {
    fPsd = json['f_psd'].cast<double>();
    psdProto1Unfiltered = json['psd_proto1_unfiltered'].cast<double>();
    psdRef1Unfiltered = json['psd_ref1_unfiltered'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['f_psd'] = this.fPsd;
    data['psd_proto1_unfiltered'] = this.psdProto1Unfiltered;
    data['psd_ref1_unfiltered'] = this.psdRef1Unfiltered;
    return data;
  }
}

class Magnitude {
  List<int>? frequency;
  List<double>? magnitudeSpectrumProto1Unfiltered;
  List<double>? magnitudeSpectrumRef1Unfiltered;

  Magnitude(
      {this.frequency,
      this.magnitudeSpectrumProto1Unfiltered,
      this.magnitudeSpectrumRef1Unfiltered});

  Magnitude.fromJson(Map<String, dynamic> json) {
    frequency = json['frequency'].cast<int>();
    magnitudeSpectrumProto1Unfiltered =
        json['magnitude_spectrum_proto1_unfiltered'].cast<double>();
    magnitudeSpectrumRef1Unfiltered =
        json['magnitude_spectrum_ref1_unfiltered'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['frequency'] = this.frequency;
    data['magnitude_spectrum_proto1_unfiltered'] =
        this.magnitudeSpectrumProto1Unfiltered;
    data['magnitude_spectrum_ref1_unfiltered'] =
        this.magnitudeSpectrumRef1Unfiltered;
    return data;
  }
}

class VdvValues {
  double? vDV;
  double? vDVX;
  double? vDVY;
  double? vDVZ;

  VdvValues({this.vDV, this.vDVX, this.vDVY, this.vDVZ});

  VdvValues.fromJson(Map<String, dynamic> json) {
    vDV = json['VDV'];
    vDVX = json['VDV_X'];
    vDVY = json['VDV_Y'];
    vDVZ = json['VDV_Z'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VDV'] = this.vDV;
    data['VDV_X'] = this.vDVX;
    data['VDV_Y'] = this.vDVY;
    data['VDV_Z'] = this.vDVZ;
    return data;
  }
}
