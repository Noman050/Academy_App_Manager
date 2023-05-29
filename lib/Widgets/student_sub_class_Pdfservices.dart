
// ignore_for_file: file_names

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class student_sub_class_Pdfservices{
  Future<Uint8List>createPdf(List data)async{
    final pw.Document doc = pw.Document();
    doc.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.letter.copyWith(marginBottom: 0.5 * PdfPageFormat.cm),
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        header: (pw.Context context) {
          return pw.Container(
              alignment: pw.Alignment.center,
              margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
              padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
              child: pw.Column(
                  children: [
                    pw.Text('Students subjects'),
                    pw.Divider(
                      color: PdfColors.blue,
                      thickness: 5.0,
                    )
                  ]
              ));
        },
        build: (pw.Context context) => <pw.Widget>[
          pw.Table.fromTextArray(
              context: context,
              border: null,
              headerAlignment: pw.Alignment.centerLeft,
              headerDecoration: const pw.BoxDecoration(color: PdfColors.blue),
              headerStyle: const pw.TextStyle(fontSize: 16.0),
              cellStyle: const pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 15.0
              ),
              data: <List<String>>[
                <String>['Name', 's1','s2','s3','s4','s5','s6','s7','s8' ],
                for (int i = 0; i <data.length; i++)
                  <String>['${i+1}) ${data.elementAt(i)['name']}','${data.elementAt(i)['s1']}'
                    ,'${data.elementAt(i)['s2']}','${data.elementAt(i)['s3']}','${data.elementAt(i)['s4']}'
                    ,'${data.elementAt(i)['s5']}','${data.elementAt(i)['s6']}','${data.elementAt(i)['s7']}'
                    ,'${data.elementAt(i)['s8']}'
                  ],
              ]),
          pw.Paragraph(text: ""),
          pw.Padding(padding: const pw.EdgeInsets.all(10)),
        ]
    ));
    return doc.save();
  }
  Future<void>saveAndLanchFile(List<int>bytes,String fileName)async{
    final path =(await getExternalStorageDirectory())?.path;
    final file=File("$path/$fileName");
    await file.writeAsBytes(bytes,flush: true);
    OpenFile.open("$path/$fileName");

  }
}