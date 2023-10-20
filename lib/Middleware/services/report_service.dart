import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';

class PdfReportService {
  Future<Uint8List> createReport(
      List<Uint8List> images,
      double dx,
      double dxd,
      double dy,
      double dyd,
      double dz,
      double dzd,
      double se,
      double sed,
      double r) {
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
                          ),
                        ),
                        pw.Text(
                          'Report',
                          style: pw.TextStyle(
                            fontSize: 14,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                pw.Text(
                  'Balvinder Singh',
                  style: const pw.TextStyle(
                    fontSize: 13,
                  ),
                ),
                pw.Text(
                  '1240.csv',
                  style: const pw.TextStyle(
                    fontSize: 13,
                  ),
                ),
                pw.Text(
                  '12th January, 2023',
                  style: const pw.TextStyle(
                    fontSize: 13,
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
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                  pw.VerticalDivider(),
                                  pw.Text(
                                    'Dxd',
                                    style: pw.TextStyle(
                                        fontSize: 10,
                                        fontWeight: pw.FontWeight.bold),
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
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                  pw.VerticalDivider(),
                                  pw.Text(
                                    'Dyd',
                                    style: pw.TextStyle(
                                        fontSize: 10,
                                        fontWeight: pw.FontWeight.bold),
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
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                  pw.VerticalDivider(),
                                  pw.Text(
                                    'Dzd',
                                    style: pw.TextStyle(
                                        fontSize: 10,
                                        fontWeight: pw.FontWeight.bold),
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
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                  pw.VerticalDivider(),
                                  pw.Text(
                                    'Sed',
                                    style: pw.TextStyle(
                                        fontSize: 10,
                                        fontWeight: pw.FontWeight.bold),
                                  ),
                                  pw.VerticalDivider(),
                                  pw.Text(
                                    'R',
                                    style: pw.TextStyle(
                                        fontSize: 10,
                                        fontWeight: pw.FontWeight.bold),
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
                                      pw.Text('Acceleartion Dose (DX)',
                                          style:
                                              const pw.TextStyle(fontSize: 8)),
                                      pw.Text(dx.toString(),
                                          style: pw.TextStyle(
                                              fontSize: 8,
                                              fontWeight: pw.FontWeight.bold)),
                                      pw.Divider(),
                                      pw.Text('Average Dose (DXD)',
                                          style:
                                              const pw.TextStyle(fontSize: 8)),
                                      pw.Text(dxd.toString(),
                                          style: pw.TextStyle(
                                              fontSize: 8,
                                              fontWeight: pw.FontWeight.bold)),
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
                                      pw.Text('Acceleartion Dose (DY)',
                                          style:
                                              const pw.TextStyle(fontSize: 8)),
                                      pw.Text(dy.toString(),
                                          style: pw.TextStyle(
                                              fontSize: 8,
                                              fontWeight: pw.FontWeight.bold)),
                                      pw.Divider(),
                                      pw.Text('Average Dose (DYD)',
                                          style:
                                              const pw.TextStyle(fontSize: 8)),
                                      pw.Text(dyd.toString(),
                                          style: pw.TextStyle(
                                              fontSize: 8,
                                              fontWeight: pw.FontWeight.bold)),
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
                                      pw.Text('Acceleartion Dose (DZ)',
                                          style:
                                              const pw.TextStyle(fontSize: 8)),
                                      pw.Text(dz.toString(),
                                          style: pw.TextStyle(
                                              fontSize: 8,
                                              fontWeight: pw.FontWeight.bold)),
                                      pw.Divider(),
                                      pw.Text('Average Dose (DZD)',
                                          style:
                                              const pw.TextStyle(fontSize: 8)),
                                      pw.Text(dzd.toString(),
                                          style: pw.TextStyle(
                                              fontSize: 8,
                                              fontWeight: pw.FontWeight.bold)),
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
                                  pw.Text('Compressive Stress (SE)',
                                      style: const pw.TextStyle(fontSize: 8)),
                                  pw.Text(se.toString(),
                                      style: pw.TextStyle(
                                          fontSize: 8,
                                          fontWeight: pw.FontWeight.bold)),
                                  pw.Divider(),
                                  pw.Text('Equivalent Static',
                                      style: const pw.TextStyle(fontSize: 8)),
                                  pw.Text('compression Dose (SED)',
                                      style: const pw.TextStyle(fontSize: 8)),
                                  pw.Text(se.toString(),
                                      style: pw.TextStyle(
                                          fontSize: 8,
                                          fontWeight: pw.FontWeight.bold)),
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

  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    final output = "/storage/emulated/0/Download";
    var filePath = "${output}/$fileName.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);
  }
}
