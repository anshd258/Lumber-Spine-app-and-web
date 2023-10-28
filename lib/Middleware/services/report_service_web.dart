import 'dart:html';
// import 'dart:typed_data';
// import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
// import 'dart:async';
import 'dart:io';
import 'package:open_file/open_file.dart';

class PdfReportServiceWeb {
  Future<Uint8List> createReportWeb(
      {required List<Uint8List> images,
      double? dxd,
      double? dyd,
      double? dz,
      double? dzd,
      required double se,
      required double sed,
      required double r}) async {
    final font = await rootBundle.load("fonts/Inter-Regular.ttf");
    final ttf = pw.Font.ttf(font);
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(0),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Center(
                  child: pw.Container(
                    height: 50,
                    width: 190,
                    padding: const pw.EdgeInsets.all(3),
                    decoration: pw.BoxDecoration(
                      color: PdfColor.fromHex('#EAC110'),
                      borderRadius: pw.BorderRadius.circular(12),
                    ),
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Lumber Spline Health',
                          style: pw.TextStyle(
                            fontSize: 14,
                            fontWeight: pw.FontWeight.bold,
                            font: ttf,
                          ),
                        ),
                        pw.Text(
                          'Report',
                          style: pw.TextStyle(
                            fontSize: 14,
                            fontWeight: pw.FontWeight.bold,
                            font: ttf,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                pw.Text(
                  'Balvinder Singh',
                  style: pw.TextStyle(
                    fontSize: 13,
                    font: ttf,
                  ),
                ),
                pw.Text(
                  '1240.csv',
                  style: pw.TextStyle(
                    fontSize: 13,
                    font: ttf,
                  ),
                ),
                pw.Text(
                  '12th January, 2023',
                  style: pw.TextStyle(
                    fontSize: 13,
                    font: ttf,
                  ),
                ),
                pw.SizedBox(
                  height: 15,
                ),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Graph Raw X: ',
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                            font: ttf,
                          ),
                        ),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Container(
                          height: 140,
                          width: 160,
                          child: pw.Image(
                            pw.MemoryImage(images[0]),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Graph Raw Y: ',
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                            font: ttf,
                          ),
                        ),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Container(
                          height: 140,
                          width: 160,
                          child: pw.Image(
                            pw.MemoryImage(images[1]),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Graph Raw Z: ',
                          style: pw.TextStyle(
                            fontSize: 10,
                            fontWeight: pw.FontWeight.bold,
                            font: ttf,
                          ),
                        ),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Container(
                          height: 140,
                          width: 160,
                          child: pw.Image(
                            pw.MemoryImage(images[2]),
                            fit: pw.BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 5,
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Graph x, y and z axis: ',
                      style: pw.TextStyle(
                        fontSize: 10,
                        fontWeight: pw.FontWeight.bold,
                        font: ttf,
                      ),
                    ),
                    pw.SizedBox(
                      height: 5,
                    ),
                    pw.Container(
                      height: 140,
                      width: 250,
                      child: pw.Image(
                        pw.MemoryImage(images[3]),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(
                  height: 15,
                ),
                pw.Row(
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Peaks: ',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                            font: ttf,
                          ),
                        ),
                        pw.SizedBox(
                          height: 5,
                        ),
                        pw.Row(
                          children: [
                            pw.Container(
                              padding: const pw.EdgeInsets.all(5),
                              height: 40,
                              width: 70,
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromHex('#EAC110'),
                                borderRadius: const pw.BorderRadius.horizontal(
                                  left: pw.Radius.circular(10),
                                  right: pw.Radius.circular(10),
                                ),
                              ),
                              child: pw.Row(
                                children: [
                                  pw.Text(
                                    'Dx',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                      font: ttf,
                                    ),
                                  ),
                                  pw.VerticalDivider(),
                                  pw.Text(
                                    'Dxd',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                      font: ttf,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.SizedBox(
                              width: 5,
                            ),
                            pw.Container(
                              padding: const pw.EdgeInsets.all(5),
                              height: 40,
                              width: 70,
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromHex('#FE8358'),
                                borderRadius: const pw.BorderRadius.horizontal(
                                  left: pw.Radius.circular(10),
                                  right: pw.Radius.circular(10),
                                ),
                              ),
                              child: pw.Row(
                                children: [
                                  pw.Text(
                                    'Dy',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                      font: ttf,
                                    ),
                                  ),
                                  pw.VerticalDivider(),
                                  pw.Text(
                                    'Dyd',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                      font: ttf,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.SizedBox(
                              width: 5,
                            ),
                            pw.Container(
                              padding: const pw.EdgeInsets.all(5),
                              height: 40,
                              width: 70,
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromHex('#65C688'),
                                borderRadius: const pw.BorderRadius.horizontal(
                                  left: pw.Radius.circular(10),
                                  right: pw.Radius.circular(10),
                                ),
                              ),
                              child: pw.Row(
                                children: [
                                  pw.Text(
                                    'Dz',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                      font: ttf,
                                    ),
                                  ),
                                  pw.VerticalDivider(),
                                  pw.Text(
                                    'Dzd',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                      font: ttf,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            pw.SizedBox(
                              width: 5,
                            ),
                            pw.Container(
                              padding: const pw.EdgeInsets.all(5),
                              height: 40,
                              width: 90,
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromHex('#5696F9'),
                                borderRadius: const pw.BorderRadius.horizontal(
                                  left: pw.Radius.circular(10),
                                  right: pw.Radius.circular(10),
                                ),
                              ),
                              child: pw.Row(
                                children: [
                                  pw.Text(
                                    'Se',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                      font: ttf,
                                    ),
                                  ),
                                  pw.VerticalDivider(),
                                  pw.Text(
                                    'Sed',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                      font: ttf,
                                    ),
                                  ),
                                  pw.VerticalDivider(),
                                  pw.Text(
                                    'R',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                      font: ttf,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(
                          height: 15,
                        ),
                        pw.Row(
                          children: [
                            pw.Column(
                              children: [
                                pw.Container(
                                  padding: const pw.EdgeInsets.all(5),
                                  height: 60,
                                  width: 120,
                                  decoration: pw.BoxDecoration(
                                    color: PdfColor.fromHex('#EAC110'),
                                    borderRadius: pw.BorderRadius.circular(10),
                                  ),
                                  child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(
                                        'Acceleartion Dose (DX)',
                                        style: pw.TextStyle(
                                          fontSize: 8,
                                          font: ttf,
                                        ),
                                      ),
                                      // pw.Text(dxd.toString(),
                                      //       style: pw.TextStyle(
                                      //           fontSize: 8,
                                      //           fontWeight: pw.FontWeight.bold)),
                                      pw.Divider(),
                                      pw.Text(
                                        'Average Dose (DXD)',
                                        style: pw.TextStyle(
                                          fontSize: 8,
                                          font: ttf,
                                        ),
                                      ),
                                      pw.Text(
                                        dxd.toString(),
                                        style: pw.TextStyle(
                                          fontSize: 8,
                                          fontWeight: pw.FontWeight.bold,
                                          font: ttf,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                pw.Container(
                                  padding: const pw.EdgeInsets.all(5),
                                  height: 60,
                                  width: 120,
                                  decoration: pw.BoxDecoration(
                                    color: PdfColor.fromHex('#FE8358'),
                                    borderRadius: pw.BorderRadius.circular(10),
                                  ),
                                  child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(
                                        'Acceleartion Dose (DY)',
                                        style: pw.TextStyle(
                                          fontSize: 8,
                                          font: ttf,
                                        ),
                                      ),
                                      // pw.Text(dy.toString(),
                                      //     style: pw.TextStyle(
                                      //         fontSize: 8,
                                      //         fontWeight: pw.FontWeight.bold)),
                                      pw.Divider(),
                                      pw.Text(
                                        'Average Dose (DYD)',
                                        style: pw.TextStyle(
                                          fontSize: 8,
                                          font: ttf,
                                        ),
                                      ),
                                      pw.Text(
                                        dyd.toString(),
                                        style: pw.TextStyle(
                                          fontSize: 8,
                                          fontWeight: pw.FontWeight.bold,
                                          font: ttf,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                pw.SizedBox(
                                  height: 5,
                                ),
                                pw.Container(
                                  padding: const pw.EdgeInsets.all(5),
                                  height: 60,
                                  width: 120,
                                  decoration: pw.BoxDecoration(
                                    color: PdfColor.fromHex('#65C688'),
                                    borderRadius: pw.BorderRadius.circular(10),
                                  ),
                                  child: pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text(
                                        'Acceleartion Dose (DZ)',
                                        style: pw.TextStyle(
                                          fontSize: 8,
                                          font: ttf,
                                        ),
                                      ),
                                      pw.Text(
                                        dz.toString(),
                                        style: pw.TextStyle(
                                          fontSize: 8,
                                          fontWeight: pw.FontWeight.bold,
                                          font: ttf,
                                        ),
                                      ),
                                      pw.Divider(),
                                      pw.Text(
                                        'Average Dose (DZD)',
                                        style: pw.TextStyle(
                                          fontSize: 8,
                                          font: ttf,
                                        ),
                                      ),
                                      pw.Text(
                                        dzd.toString(),
                                        style: pw.TextStyle(
                                          fontSize: 8,
                                          fontWeight: pw.FontWeight.bold,
                                          font: ttf,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            pw.SizedBox(width: 10),
                            pw.Container(
                              padding: const pw.EdgeInsets.all(5),
                              height: 190,
                              width: 120,
                              decoration: pw.BoxDecoration(
                                color: PdfColor.fromHex('#5696F9'),
                                borderRadius: pw.BorderRadius.circular(10),
                              ),
                              child: pw.Column(
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text(
                                    'Compressive Stress (SE)',
                                    style: pw.TextStyle(
                                      fontSize: 8,
                                      font: ttf,
                                    ),
                                  ),
                                  pw.Text(
                                    se.toString(),
                                    style: pw.TextStyle(
                                      fontSize: 8,
                                      fontWeight: pw.FontWeight.bold,
                                      font: ttf,
                                    ),
                                  ),
                                  pw.Divider(),
                                  pw.Text(
                                    'Equivalent Static',
                                    style: pw.TextStyle(
                                      fontSize: 8,
                                      font: ttf,
                                    ),
                                  ),
                                  pw.Text(
                                    'compression Dose (SED)',
                                    style: pw.TextStyle(
                                      fontSize: 8,
                                      font: ttf,
                                    ),
                                  ),
                                  pw.Text(
                                    se.toString(),
                                    style: pw.TextStyle(
                                      fontSize: 8,
                                      fontWeight: pw.FontWeight.bold,
                                      font: ttf,
                                    ),
                                  ),
                                  pw.Divider(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    pw.SizedBox(
                      width: 20,
                    ),
                    pw.Container(
                      height: 250,
                      width: 120,
                      child: pw.Image(
                        pw.MemoryImage(images[4]),
                        fit: pw.BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
    return pdf.save();
  }

  void downloadPdfInChrome(Uint8List pdfBytes, String fileName) {
  final blob = Blob([pdfBytes]);
  final url = Url.createObjectUrlFromBlob(blob);

  final anchor = AnchorElement(href: url)
    ..target = 'webdownload'
    ..download = fileName
    ..setAttribute('type', 'application/pdf'); 

  anchor.click();

  Url.revokeObjectUrl(url);
}

// Future<void> _saveAsFile(
//   PdfDocument pdf,
//   String fileName,
// ) async {
//   final output = await getExternalStorageDirectory();
//   final filePath = '${output?.path}/$fileName.pdf';

//   final file = File(filePath);
//   await file.writeAsBytes(pdf.save());
//   await OpenFile.open(filePath);
// }
}
