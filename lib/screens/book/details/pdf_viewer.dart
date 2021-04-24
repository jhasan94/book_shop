import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:book_shop/api.dart';
import 'package:flutter/material.dart';

class PdfViewer extends StatefulWidget {
  final String pdfUrl;
  const PdfViewer({Key key, this.pdfUrl}) : super(key: key);

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  //sample pdf url = 'https://www.antennahouse.com/hubfs/xsl-fo-sample/pdf/basic-link-1.pdf?hsLang=en'
  loadDocument() async {
    document = await PDFDocument.fromURL(Api.fileDir + widget.pdfUrl);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      //backgroundColor: widget.product.color,
      appBar: buildAppBar(context),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PDFViewer(
              document: document,
              indicatorBackground: Colors.red,
              lazyLoad: true,
              pickerButtonColor: Colors.green,
              indicatorText: Colors.amber,
              scrollDirection: Axis.vertical,
              // showIndicator: false,
              // showPicker: false,
            ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
