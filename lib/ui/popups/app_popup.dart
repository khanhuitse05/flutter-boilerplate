import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum MenuItem { edit, delete, open, setDefault }

class AppPopup {
  static Future<void> showBottomSheetWithAppbar(
    BuildContext context, {
    String title,
    List<Widget> content,
  }) async {
    return showModalBottomSheet(
      useRootNavigator: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) {
        return Container(
          color: Theme.of(context).backgroundColor,
          margin: const EdgeInsets.only(top: 50),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      const SizedBox(height: 60),
                      ...content,
                      const SizedBox(height: 50)
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 1,
                      style: BorderStyle.solid,
                    )),
                  ),
                  height: kToolbarHeight,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.title,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          softWrap: true,
                        ),
                      ),
                      Container(
                        width: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> showBottomSheet(
    BuildContext context, {
    String title,
    List<Widget> content,
  }) async {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (_) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: ListBody(
              children: [
                Container(
                  height: 70,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            title ?? '',
                            style: Theme.of(context).textTheme.title,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                ...content,
                Container(height: 50)
              ],
            ),
          ),
        );
      },
    );
  }
}
