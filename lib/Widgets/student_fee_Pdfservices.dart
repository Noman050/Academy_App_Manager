// ignore_for_file: file_names, camel_case_types

import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class student_fee_Pdfservices{
  Future<Uint8List>createPdf(List data)async{

    final pw.Document doc = pw.Document();

    doc.addPage(pw.MultiPage(
        pageFormat: PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        header: (pw.Context context) {
          return pw.Container(
              alignment: pw.Alignment.center,
              margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
              padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
              child: pw.Column(
                  children: [
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
              headerStyle: const pw.TextStyle(fontSize: 6.0),
              cellStyle: const pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 6.0
              ),
              data: <List<String>>[
                <String>['Name', 'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec' ],
                for (int i = 0; i <data.length; i++)
                  <String>['${i+1}) ${data.elementAt(i)['name']}','${data.elementAt(i)['jan']}'
                    ,'${data.elementAt(i)['feb']}','${data.elementAt(i)['mar']}','${data.elementAt(i)['apr']}'
                    ,'${data.elementAt(i)['may']}','${data.elementAt(i)['jun']}','${data.elementAt(i)['jul']}'
                    ,'${data.elementAt(i)['aug']}','${data.elementAt(i)['sep']}','${data.elementAt(i)['oct']}'
                    ,'${data.elementAt(i)['nov']}','${data.elementAt(i)['dec']}'
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