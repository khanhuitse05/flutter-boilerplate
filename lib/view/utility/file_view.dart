import 'package:my_app/ui/utility/html_content.dart';
import 'package:my_app/ui/utility/indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FileViewRouter extends StatefulWidget {
  FileViewRouter(this.url, this.name);

  final String url;
  final String name;

  @override
  _FileViewRouterState createState() => _FileViewRouterState();
}

class _FileViewRouterState extends State<FileViewRouter> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFile();
  }

  loadFile() async {
    try {
      var _data = await rootBundle.loadString(widget.url);
      print(_data.toString());
      setState(() {
        content = _data;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  var content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.name),
      ),
      body: content == null
          ? Container(
              child: Indicator(),
            )
          : ListView(
              children: <Widget>[HtmlContent(content)],
            ),
    );
  }
}
