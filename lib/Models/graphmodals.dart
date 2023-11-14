class ResponseGraphModal {
  Aw? aw;
  AwGraph? awGraph;
  AwNew? awNew;
  Data? data;
  Ft? ft;
  RRange? rRange;
  RRange? sedRange;
  VdvValues? vdvValues;

  ResponseGraphModal(
      {this.aw,
      this.sedRange,
      this.rRange,
      this.awGraph,
      this.awNew,
      this.data,
      this.ft,
      this.vdvValues});

  ResponseGraphModal.fromJson(Map<String, dynamic> json) {
    aw = json['aw'] != null ? new Aw.fromJson(json['aw']) : null;
    awGraph = json['aw_graph'] != null
        ? new AwGraph.fromJson(json['aw_graph'])
        : null;

    awNew = json['aw_new'] != null ? new AwNew.fromJson(json['aw_new']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    ft = json['ft'] != null ? new Ft.fromJson(json['ft']) : null;
    rRange =
        json['r_range'] != null ? new RRange.fromJson(json['r_range']) : null;
    sedRange = json['sed_range'] != null
        ? new RRange.fromJson(json['sed_range'])
        : null;
    vdvValues = json['vdv_values'] != null
        ? new VdvValues.fromJson(json['vdv_values'])
        : null;
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

class AwGraph {
  double? aW;
  double? aWX;
  double? aWY;
  double? aWZ;
  double? aWMAX;
  AwGraph({this.aW, this.aWX, this.aWY, this.aWZ, this.aWMAX});
  AwGraph.fromJson(Map<String, dynamic> json) {
    aW = json['AW'];
    aWX = json['AWX'];
    aWY = json['AWY'];
    aWZ = json['AWZ'];
    aWMAX = json['AW_MAX'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AW'] = this.aW;
    data['AWX'] = this.aWX;
    data['AWY'] = this.aWY;
    data['AWZ'] = this.aWZ;
    data['AW_MAX'] = this.aWMAX;
    return data;
  }
}

class AwNew {
  List<double>? awXnew;
  List<double>? awYnew;
  List<double>? awZnew;
  double? awx;
  double? awy;
  double? awz;

  AwNew({this.awXnew, this.awYnew, this.awZnew, this.awx, this.awy, this.awz});

  AwNew.fromJson(Map<String, dynamic> json) {
    awXnew = json['aw_Xnew'].cast<double>();
    awYnew = json['aw_Ynew'].cast<double>();
    awZnew = json['aw_Znew'].cast<double>();
    awx = json['awx'];
    awy = json['awy'];
    awz = json['awz'];
  }
}

class RRange {
  double? endingvalueHigh;
  double? endingvalueLow;
  double? endingvalueMid;
  double? startvalueHigh;
  double? startvalueLow;
  double? startvalueMid;
  RRange(
      {this.endingvalueHigh,
      this.endingvalueLow,
      this.endingvalueMid,
      this.startvalueHigh,
      this.startvalueLow,
      this.startvalueMid});
  RRange.fromJson(Map<String, dynamic> json) {
    endingvalueHigh = json['endingvalue_high'];
    endingvalueLow = json['endingvalue_low'];
    endingvalueMid = json['endingvalue_mid'];
    startvalueHigh = json['startvalue_high'];
    startvalueLow = json['startvalue_low'];
    startvalueMid = json['startvalue_mid'];
  }
}

class Data {
  AccelrationDoses? accelrationDoses;
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
  String? remark;
  List<String>? rawTimeX;
  List<String>? rawTimeY;
  List<String>? rawTimeZ;
  double? se;
  double? sed;
  double? timeStamp;

  Data(
      {this.accelrationDoses,
      this.r,
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
      this.remark,
      this.timeStamp,
      this.sed});

  Data.fromJson(Map<String, dynamic> json) {
    accelrationDoses = json['accelration_doses'] != null
        ? new AccelrationDoses.fromJson(json['accelration_doses'])
        : null;
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
    remark = json['remark'];
    se = json['se'];
    sed = json['sed'];
    timeStamp = json['timeStamp'];
  }
}

class AccelrationDoses {
  double? dx;
  double? dxd;
  double? dy;
  double? dyd;
  double? dz;
  double? dzd;
  AccelrationDoses({this.dx, this.dxd, this.dy, this.dyd, this.dz, this.dzd});
  AccelrationDoses.fromJson(Map<String, dynamic> json) {
    dx = json['dx'];
    dxd = json['dxd'];
    dy = json['dy'];
    dyd = json['dyd'];
    dz = json['dz'];
    dzd = json['dzd'];
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
}

class VdvValues {
  double? vDV;
  double? vDVMax;
  double? vDVX;
  double? vDVY;
  double? vDVZ;

  VdvValues({this.vDV, this.vDVX, this.vDVMax, this.vDVY, this.vDVZ});

  VdvValues.fromJson(Map<String, dynamic> json) {
    vDV = json['VDV'];
    vDVMax = json['VDV_Max'];
    vDVX = json['VDV_X'];
    vDVY = json['VDV_Y'];
    vDVZ = json['VDV_Z'];
  }
}
