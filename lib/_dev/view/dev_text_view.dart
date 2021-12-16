import 'package:flutter/material.dart';
import 'package:my_app/src/theme/colors.dart';

class DevTextView extends StatelessWidget {
  const DevTextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('text Theme'),
      ),
      body: CustomScrollView(
        slivers: [
          _title('Theme Typography'),
          _buildTypography(context),
        ],
      ),
    );
  }

  Widget _title(String title) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: XColors.text,
          ),
        ),
      ),
    );
  }

  Widget _buildTypography(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "H1",
                  style: Theme.of(context).textTheme.headline1,
                  maxLines: 1,
                ),
                Text("Light 96")
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "H2",
                  style: Theme.of(context).textTheme.headline2,
                  maxLines: 1,
                ),
                Text("Light 60")
              ],
            ),
            Text("Used for the date in the dialog shown by [showDatePicker]."),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "H3",
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text("Regular 48")
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "H4",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text("Regular 34")
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "H5",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text("Regular 24")
              ],
            ),
            Text(
                "Used for large text in dialogs (e.g., the month and year in the dialog shown by [showDatePicker])."),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "H6",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text("Medium 20")
              ],
            ),
            Text(
                "Used for the primary text in app bars and dialogs (e.g., [AppBar.title] and [AlertDialog.title])."),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Subtitle1",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text("Regular 16")
              ],
            ),
            Text(
                "Used for the primary text in lists (e.g., [ListTile.title])."),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Subtitle2",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text("Medium 14")
              ],
            ),
            Text(
                "For medium emphasis text that's a little smaller than [subtitle1]."),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "BodyText1",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text("Regular 16")
              ],
            ),
            Text(
                "Used for emphasizing text that would otherwise be [bodyText2]."),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "BodyText2 (Default)",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text("Regular 14")
              ],
            ),
            Text("The default text style for [Material]."),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Button",
                  style: Theme.of(context).textTheme.button,
                ),
                Text("MEDIUM 14")
              ],
            ),
            Text("Used for text on [RaisedButton] and [FlatButton]."),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Caption",
                  style: Theme.of(context).textTheme.caption,
                ),
                Text("Regular 12")
              ],
            ),
            Text("Used for auxiliary text associated with images."),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Overline",
                  style: Theme.of(context).textTheme.overline,
                ),
                Text("REGULAR 10")
              ],
            ),
            Text(
                "Typically used for captions or to introduce a (larger) headline.")
          ],
        ),
      ),
    );
  }
}
