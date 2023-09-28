import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;

class PdfReportService {
  Future<Uint8List> createReport(List<Uint8List> images) {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(children: [
           
            pw.Text('Hey'),
            pw.Image(
              pw.RawImage(bytes: images[1], width: 200, height: 200),
            )
          ]);
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
