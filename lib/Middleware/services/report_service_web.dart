import 'dart:html' as h;

// import 'dart:typed_data';
// import 'package:flutter/rendering.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/pdf.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class PdfReportServiceWeb {
  Future<Uint8List> createReportWebsync({
    required Size size,
    required Uint8List imagei
  }) async {
    print("creating report");
    final PdfDocument document = PdfDocument();
     print("creating report");
//Read image data. print("creating report");

//Load the image using PdfBitmap.
    final PdfBitmap image = PdfBitmap(imagei.toList());
     print("creating report");
//Draw the image to the PDF page.
    document.pages
        .add()
        .graphics
        .drawImage(image, Rect.fromLTWH(0, 0, size.width, size.height));
         print("creating report");
// Save the document.
    Uint8List result = Uint8List.fromList(await document.save());
     print("creating report");
    document.dispose();
      print("creaded report");
    return result;
// Dispose the document.
  }
  // Future<Uint8List> createReportWeb({
  //   required List<Uint8List> images,
  //   double? dx,
  //   double? dxd,
  //   double? dy,
  //   double? dyd,
  //   double? dz,
  //   double? dzd,
  //   double? vdv,
  //   double? vdx,
  //   double? vdy,
  //   double? vdz,
  //   required double se,
  //   required double sed,
  //   required double r,
  // }) async {
  //   final font = await rootBundle.load("fonts/Inter-Regular.ttf");
  //   final ttf = pw.Font.ttf(font);
  //   final pdf = pw.Document();
  //   pdf.addPage(
  //     pw.Page(
  //       build: (pw.Context context) {
  //         return pw.Padding(
  //           padding: const pw.EdgeInsets.all(0),
  //           child: pw.Column(
  //             crossAxisAlignment: pw.CrossAxisAlignment.start,
  //             children: [
  //               pw.Center(
  //                 child: pw.Container(
  //                     height: 35,
  //                     width: 80,
  //                     padding: const pw.EdgeInsets.all(3),
  //                     decoration: pw.BoxDecoration(
  //                       color: PdfColor.fromHex('#EAC110'),
  //                       borderRadius: pw.BorderRadius.circular(12),
  //                     ),
  //                     child: pw.Center(
  //                       child: pw.Text(
  //                         'Results',
  //                         style: pw.TextStyle(
  //                           fontSize: 14,
  //                           fontWeight: pw.FontWeight.bold,
  //                           font: ttf,
  //                         ),
  //                       ),
  //                     )),
  //               ),
  //               pw.SizedBox(
  //                 height: 10,
  //               ),
  //               pw.Center(
  //                 child: pw.Text(
  //                   'Section 1: Graph',
  //                   style: pw.TextStyle(
  //                     fontSize: 10,
  //                     font: ttf,
  //                   ),
  //                 ),
  //               ),
  //               pw.SizedBox(
  //                 height: 10,
  //               ),
  //               pw.Row(
  //                 mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
  //                 children: [
  //                   pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text(
  //                         'Graph Raw X: ',
  //                         style: pw.TextStyle(
  //                           fontSize: 8,
  //                           fontWeight: pw.FontWeight.bold,
  //                           font: ttf,
  //                         ),
  //                       ),
  //                       pw.SizedBox(
  //                         height: 5,
  //                       ),
  //                       pw.Container(
  //                         height: 100,
  //                         width: 150,
  //                         child: pw.Image(
  //                           pw.MemoryImage(images[0]),
  //                           fit: pw.BoxFit.fill,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text(
  //                         'Graph Raw Y: ',
  //                         style: pw.TextStyle(
  //                           fontSize: 8,
  //                           fontWeight: pw.FontWeight.bold,
  //                           font: ttf,
  //                         ),
  //                       ),
  //                       pw.SizedBox(
  //                         height: 5,
  //                       ),
  //                       pw.Container(
  //                         height: 100,
  //                         width: 150,
  //                         child: pw.Image(
  //                           pw.MemoryImage(images[1]),
  //                           fit: pw.BoxFit.fill,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text(
  //                         'Graph Raw Z: ',
  //                         style: pw.TextStyle(
  //                           fontSize: 8,
  //                           fontWeight: pw.FontWeight.bold,
  //                           font: ttf,
  //                         ),
  //                       ),
  //                       pw.SizedBox(
  //                         height: 5,
  //                       ),
  //                       pw.Container(
  //                         height: 100,
  //                         width: 150,
  //                         child: pw.Image(
  //                           pw.MemoryImage(images[2]),
  //                           fit: pw.BoxFit.fill,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //               pw.SizedBox(
  //                 height: 5,
  //               ),
  //               pw.Column(
  //                 crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                 children: [
  //                   pw.Text(
  //                     'All Graphs',
  //                     style: pw.TextStyle(
  //                       fontSize: 8,
  //                       fontWeight: pw.FontWeight.bold,
  //                       font: ttf,
  //                     ),
  //                   ),
  //                   pw.SizedBox(
  //                     height: 5,
  //                   ),
  //                   pw.Container(
  //                     height: 120,
  //                     width: 300,
  //                     child: pw.Image(
  //                       pw.MemoryImage(images[3]),
  //                       fit: pw.BoxFit.fill,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               pw.SizedBox(
  //                 height: 10,
  //               ),
  //               pw.Center(
  //                 child: pw.Text(
  //                   'Section 2: Frequency Analysis',
  //                   style: pw.TextStyle(
  //                     fontSize: 10,
  //                     font: ttf,
  //                   ),
  //                 ),
  //               ),
  //               pw.Row(
  //                 children: [
  //                   pw.Column(
  //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                     children: [
  //                       pw.Text(
  //                         'Peaks: ',
  //                         style: pw.TextStyle(
  //                           fontSize: 12,
  //                           fontWeight: pw.FontWeight.bold,
  //                           font: ttf,
  //                         ),
  //                       ),
  //                       pw.SizedBox(
  //                         height: 5,
  //                       ),
  //                       // pw.Row(
  //                       //   children: [
  //                       //     pw.Container(
  //                       //       padding: const pw.EdgeInsets.all(5),
  //                       //       height: 40,
  //                       //       width: 70,
  //                       //       decoration: pw.BoxDecoration(
  //                       //         color: PdfColor.fromHex('#EAC110'),
  //                       //         borderRadius: const pw.BorderRadius.horizontal(
  //                       //           left: pw.Radius.circular(10),
  //                       //           right: pw.Radius.circular(10),
  //                       //         ),
  //                       //       ),
  //                       //       child: pw.Row(
  //                       //         children: [
  //                       //           pw.Text(
  //                       //             'Dx',
  //                       //             style: pw.TextStyle(
  //                       //               fontSize: 10,
  //                       //               fontWeight: pw.FontWeight.bold,
  //                       //               font: ttf,
  //                       //             ),
  //                       //           ),
  //                       //           pw.VerticalDivider(),
  //                       //           pw.Text(
  //                       //             'Dxd',
  //                       //             style: pw.TextStyle(
  //                       //               fontSize: 10,
  //                       //               fontWeight: pw.FontWeight.bold,
  //                       //               font: ttf,
  //                       //             ),
  //                       //           ),
  //                       //         ],
  //                       //       ),
  //                       //     ),
  //                       //     pw.SizedBox(
  //                       //       width: 5,
  //                       //     ),
  //                       //     pw.Container(
  //                       //       padding: const pw.EdgeInsets.all(5),
  //                       //       height: 40,
  //                       //       width: 70,
  //                       //       decoration: pw.BoxDecoration(
  //                       //         color: PdfColor.fromHex('#FE8358'),
  //                       //         borderRadius: const pw.BorderRadius.horizontal(
  //                       //           left: pw.Radius.circular(10),
  //                       //           right: pw.Radius.circular(10),
  //                       //         ),
  //                       //       ),
  //                       //       child: pw.Row(
  //                       //         children: [
  //                       //           pw.Text(
  //                       //             'Dy',
  //                       //             style: pw.TextStyle(
  //                       //               fontSize: 10,
  //                       //               fontWeight: pw.FontWeight.bold,
  //                       //               font: ttf,
  //                       //             ),
  //                       //           ),
  //                       //           pw.VerticalDivider(),
  //                       //           pw.Text(
  //                       //             'Dyd',
  //                       //             style: pw.TextStyle(
  //                       //               fontSize: 10,
  //                       //               fontWeight: pw.FontWeight.bold,
  //                       //               font: ttf,
  //                       //             ),
  //                       //           ),
  //                       //         ],
  //                       //       ),
  //                       //     ),
  //                       //     pw.SizedBox(
  //                       //       width: 5,
  //                       //     ),
  //                       //     pw.Container(
  //                       //       padding: const pw.EdgeInsets.all(5),
  //                       //       height: 40,
  //                       //       width: 70,
  //                       //       decoration: pw.BoxDecoration(
  //                       //         color: PdfColor.fromHex('#65C688'),
  //                       //         borderRadius: const pw.BorderRadius.horizontal(
  //                       //           left: pw.Radius.circular(10),
  //                       //           right: pw.Radius.circular(10),
  //                       //         ),
  //                       //       ),
  //                       //       child: pw.Row(
  //                       //         children: [
  //                       //           pw.Text(
  //                       //             'Dz',
  //                       //             style: pw.TextStyle(
  //                       //               fontSize: 10,
  //                       //               fontWeight: pw.FontWeight.bold,
  //                       //               font: ttf,
  //                       //             ),
  //                       //           ),
  //                       //           pw.VerticalDivider(),
  //                       //           pw.Text(
  //                       //             'Dzd',
  //                       //             style: pw.TextStyle(
  //                       //               fontSize: 10,
  //                       //               fontWeight: pw.FontWeight.bold,
  //                       //               font: ttf,
  //                       //             ),
  //                       //           ),
  //                       //         ],
  //                       //       ),
  //                       //     ),
  //                       //     pw.SizedBox(
  //                       //       width: 5,
  //                       //     ),
  //                       //     pw.Container(
  //                       //       padding: const pw.EdgeInsets.all(5),
  //                       //       height: 40,
  //                       //       width: 90,
  //                       //       decoration: pw.BoxDecoration(
  //                       //         color: PdfColor.fromHex('#5696F9'),
  //                       //         borderRadius: const pw.BorderRadius.horizontal(
  //                       //           left: pw.Radius.circular(10),
  //                       //           right: pw.Radius.circular(10),
  //                       //         ),
  //                       //       ),
  //                       //       child: pw.Row(
  //                       //         children: [
  //                       //           pw.Text(
  //                       //             'Se',
  //                       //             style: pw.TextStyle(
  //                       //               fontSize: 10,
  //                       //               fontWeight: pw.FontWeight.bold,
  //                       //               font: ttf,
  //                       //             ),
  //                       //           ),
  //                       //           pw.VerticalDivider(),
  //                       //           pw.Text(
  //                       //             'Sed',
  //                       //             style: pw.TextStyle(
  //                       //               fontSize: 10,
  //                       //               fontWeight: pw.FontWeight.bold,
  //                       //               font: ttf,
  //                       //             ),
  //                       //           ),
  //                       //           pw.VerticalDivider(),
  //                       //           pw.Text(
  //                       //             'R',
  //                       //             style: pw.TextStyle(
  //                       //               fontSize: 10,
  //                       //               fontWeight: pw.FontWeight.bold,
  //                       //               font: ttf,
  //                       //             ),
  //                       //           ),
  //                       //         ],
  //                       //       ),
  //                       //     ),
  //                       //   ],
  //                       // ),
  //                       pw.SizedBox(
  //                         height: 15,
  //                       ),
  //                       pw.Row(
  //                         mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
  //                         children: [
  //                           pw.Column(
  //                             children: [
  //                               pw.Container(
  //                                 padding: const pw.EdgeInsets.all(5),
  //                                 height: 60,
  //                                 width: 120,
  //                                 decoration: pw.BoxDecoration(
  //                                   color: PdfColor.fromHex('#EAC110'),
  //                                   borderRadius: pw.BorderRadius.circular(10),
  //                                 ),
  //                                 child: pw.Column(
  //                                   crossAxisAlignment:
  //                                       pw.CrossAxisAlignment.start,
  //                                   children: [
  //                                     pw.Text(
  //                                       'Acceleartion Dose (DX)',
  //                                       style: pw.TextStyle(
  //                                         fontSize: 8,
  //                                         font: ttf,
  //                                       ),
  //                                     ),
  //                                     // pw.Text(dxd.toString(),
  //                                     //       style: pw.TextStyle(
  //                                     //           fontSize: 8,
  //                                     //           fontWeight: pw.FontWeight.bold)),
  //                                     pw.Divider(),
  //                                     pw.Text(
  //                                       'Average Dose (DXD)',
  //                                       style: pw.TextStyle(
  //                                         fontSize: 8,
  //                                         font: ttf,
  //                                       ),
  //                                     ),
  //                                     pw.Text(
  //                                       dxd.toString(),
  //                                       style: pw.TextStyle(
  //                                         fontSize: 8,
  //                                         fontWeight: pw.FontWeight.bold,
  //                                         font: ttf,
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ),
  //                               pw.SizedBox(
  //                                 height: 5,
  //                               ),
  //                               pw.Container(
  //                                 padding: const pw.EdgeInsets.all(5),
  //                                 height: 60,
  //                                 width: 120,
  //                                 decoration: pw.BoxDecoration(
  //                                   color: PdfColor.fromHex('#FE8358'),
  //                                   borderRadius: pw.BorderRadius.circular(10),
  //                                 ),
  //                                 child: pw.Column(
  //                                   crossAxisAlignment:
  //                                       pw.CrossAxisAlignment.start,
  //                                   children: [
  //                                     pw.Text(
  //                                       'Acceleartion Dose (DY)',
  //                                       style: pw.TextStyle(
  //                                         fontSize: 8,
  //                                         font: ttf,
  //                                       ),
  //                                     ),
  //                                     // pw.Text(dy.toString(),
  //                                     //     style: pw.TextStyle(
  //                                     //         fontSize: 8,
  //                                     //         fontWeight: pw.FontWeight.bold)),
  //                                     pw.Divider(),
  //                                     pw.Text(
  //                                       'Average Dose (DYD)',
  //                                       style: pw.TextStyle(
  //                                         fontSize: 8,
  //                                         font: ttf,
  //                                       ),
  //                                     ),
  //                                     pw.Text(
  //                                       dyd.toString(),
  //                                       style: pw.TextStyle(
  //                                         fontSize: 8,
  //                                         fontWeight: pw.FontWeight.bold,
  //                                         font: ttf,
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ),
  //                               pw.SizedBox(
  //                                 height: 5,
  //                               ),
  //                               pw.Container(
  //                                 padding: const pw.EdgeInsets.all(5),
  //                                 height: 60,
  //                                 width: 120,
  //                                 decoration: pw.BoxDecoration(
  //                                   color: PdfColor.fromHex('#65C688'),
  //                                   borderRadius: pw.BorderRadius.circular(10),
  //                                 ),
  //                                 child: pw.Column(
  //                                   crossAxisAlignment:
  //                                       pw.CrossAxisAlignment.start,
  //                                   children: [
  //                                     pw.Text(
  //                                       'Acceleartion Dose (DZ)',
  //                                       style: pw.TextStyle(
  //                                         fontSize: 8,
  //                                         font: ttf,
  //                                       ),
  //                                     ),
  //                                     pw.Text(
  //                                       dz.toString(),
  //                                       style: pw.TextStyle(
  //                                         fontSize: 8,
  //                                         fontWeight: pw.FontWeight.bold,
  //                                         font: ttf,
  //                                       ),
  //                                     ),
  //                                     pw.Divider(),
  //                                     pw.Text(
  //                                       'Average Dose (DZD)',
  //                                       style: pw.TextStyle(
  //                                         fontSize: 8,
  //                                         font: ttf,
  //                                       ),
  //                                     ),
  //                                     pw.Text(
  //                                       dzd.toString(),
  //                                       style: pw.TextStyle(
  //                                         fontSize: 8,
  //                                         fontWeight: pw.FontWeight.bold,
  //                                         font: ttf,
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                           pw.SizedBox(width: 10),
  //                           pw.Container(
  //                             padding: const pw.EdgeInsets.all(5),
  //                             height: 190,
  //                             width: 120,
  //                             decoration: pw.BoxDecoration(
  //                               color: PdfColor.fromHex('#5696F9'),
  //                               borderRadius: pw.BorderRadius.circular(10),
  //                             ),
  //                             child: pw.Column(
  //                               crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                               children: [
  //                                 pw.Text(
  //                                   'Compressive Stress (SE)',
  //                                   style: pw.TextStyle(
  //                                     fontSize: 8,
  //                                     font: ttf,
  //                                   ),
  //                                 ),
  //                                 pw.Text(
  //                                   se.toString(),
  //                                   style: pw.TextStyle(
  //                                     fontSize: 8,
  //                                     fontWeight: pw.FontWeight.bold,
  //                                     font: ttf,
  //                                   ),
  //                                 ),
  //                                 pw.Divider(),
  //                                 pw.Text(
  //                                   'Equivalent Static',
  //                                   style: pw.TextStyle(
  //                                     fontSize: 8,
  //                                     font: ttf,
  //                                   ),
  //                                 ),
  //                                 pw.Text(
  //                                   'compression Dose (SED)',
  //                                   style: pw.TextStyle(
  //                                     fontSize: 8,
  //                                     font: ttf,
  //                                   ),
  //                                 ),
  //                                 pw.Text(
  //                                   se.toString(),
  //                                   style: pw.TextStyle(
  //                                     fontSize: 8,
  //                                     fontWeight: pw.FontWeight.bold,
  //                                     font: ttf,
  //                                   ),
  //                                 ),
  //                                 pw.Divider(),
  //                               ],
  //                             ),
  //                           ),
  //                           pw.SizedBox(width: 10),
  //                           pw.Container(
  //                             padding: const pw.EdgeInsets.all(5),
  //                             height: 190,
  //                             width: 180,
  //                             decoration: pw.BoxDecoration(
  //                               color: PdfColor.fromHex('#F3BE43'),
  //                               borderRadius: pw.BorderRadius.circular(10),
  //                             ),
  //                             child: pw.Column(
  //                               crossAxisAlignment: pw.CrossAxisAlignment.start,
  //                               children: [
  //                                 pw.Text(
  //                                   'Vibration Dose Value (VDV)',
  //                                   style: pw.TextStyle(
  //                                     fontSize: 8,
  //                                     font: ttf,
  //                                   ),
  //                                 ),
  //                                 pw.Text(
  //                                   vdv.toString(),
  //                                   style: pw.TextStyle(
  //                                     fontSize: 8,
  //                                     fontWeight: pw.FontWeight.bold,
  //                                     font: ttf,
  //                                   ),
  //                                 ),
  //                                 pw.Divider(),
  //                                 pw.Text(
  //                                   'Vibration Dose Value (VDV-X)',
  //                                   style: pw.TextStyle(
  //                                     fontSize: 8,
  //                                     font: ttf,
  //                                   ),
  //                                 ),
  //                                 pw.Text(
  //                                   vdx.toString(),
  //                                   style: pw.TextStyle(
  //                                     fontSize: 8,
  //                                     fontWeight: pw.FontWeight.bold,
  //                                     font: ttf,
  //                                   ),
  //                                 ),
  //                                 pw.Divider(),
  //                                 pw.Text(
  //                                   'Vibration Dose Value (VDV-Y)',
  //                                   style: pw.TextStyle(
  //                                     fontSize: 8,
  //                                     font: ttf,
  //                                   ),
  //                                 ),
  //                                 pw.Text(
  //                                   vdy.toString(),
  //                                   style: pw.TextStyle(
  //                                     fontSize: 8,
  //                                     fontWeight: pw.FontWeight.bold,
  //                                     font: ttf,
  //                                   ),
  //                                 ),
  //                                 pw.Divider(),
  //                                 pw.Text(
  //                                   'Vibration Dose Value (VDV-Z)',
  //                                   style: pw.TextStyle(
  //                                     fontSize: 8,
  //                                     font: ttf,
  //                                   ),
  //                                 ),
  //                                 pw.Text(
  //                                   vdz.toString(),
  //                                   style: pw.TextStyle(
  //                                     fontSize: 8,
  //                                     fontWeight: pw.FontWeight.bold,
  //                                     font: ttf,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //               pw.SizedBox(
  //                 height: 10,
  //               ),
  //               pw.Row(
  //                   mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
  //                   children: [
  //                     pw.Column(
  //                       children: [
  //                         pw.Text(
  //                           'Section 3: Adverse Health Effects',
  //                           style: pw.TextStyle(
  //                             fontSize: 10,
  //                             font: ttf,
  //                           ),
  //                         ),
  //                         pw.SizedBox(
  //                           height: 10,
  //                         ),
  //                         pw.Container(
  //                           height: 100,
  //                           width: 120,
  //                           child: pw.Image(
  //                             pw.MemoryImage(images[4]),
  //                             fit: pw.BoxFit.fill,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     pw.Column(
  //                       children: [
  //                         pw.Text(
  //                           'Section 4: Power Spectral Density',
  //                           style: pw.TextStyle(
  //                             fontSize: 10,
  //                             font: ttf,
  //                           ),
  //                         ),
  //                         pw.SizedBox(
  //                           height: 10,
  //                         ),
  //                         pw.Row(
  //                           children: [
  //                             pw.Container(
  //                               height: 100,
  //                               width: 150,
  //                               child: pw.Image(
  //                                 pw.MemoryImage(images[5]),
  //                                 fit: pw.BoxFit.fill,
  //                               ),
  //                             ),
  //                             pw.SizedBox(width: 20),
  //                             pw.Container(
  //                               height: 100,
  //                               width: 150,
  //                               child: pw.Image(
  //                                 pw.MemoryImage(images[6]),
  //                                 fit: pw.BoxFit.fill,
  //                               ),
  //                             ),
  //                           ],
  //                         )
  //                       ],
  //                     ),
  //                   ]),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  //   return pdf.save();
  // }

  void downloadPdfInChrome(Uint8List pdfBytes, String fileName) async {
    await FileSaver.instance.saveFile(
        name: "report", ext: ".pdf", bytes: pdfBytes, mimeType: MimeType.pdf);
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
