import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
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
          _buildTypography(context),
        ],
      ),
    );
  }

  Widget _title(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _subTitle(String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Text(
        title,
      ),
    );
  }

  Widget _buildTypography(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            _title(context, '1. Display styles'),
            _subTitle(
                "As the largest text on the screen, display styles are reserved for short, important text or numerals. They work best on large screens."),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "DL",
                  style: Theme.of(context).textTheme.displayLarge,
                  maxLines: 1,
                ),
                Text("Regular 57")
              ],
            ),
            Text('Largest of the display styles.'),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "DM",
                  style: Theme.of(context).textTheme.displayMedium,
                  maxLines: 1,
                ),
                Text("Regular 45")
              ],
            ),
            Text('Middle size of the display styles.'),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "DS",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text("Regular 36")
              ],
            ),
            Text('Smallest size of the display styles.'),
            Divider(),
            _title(context, '2. Headline styles'),
            _subTitle(
                "Headline styles are smaller than display styles. They're best-suited for short, high-emphasis text on smaller screens."),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Headline Large",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text("Regular 32")
              ],
            ),
            Text('Largest of the headline styles.'),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Headline Medium",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text("Regular 28")
              ],
            ),
            Text('Medium of the headline styles.'),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Headline Small",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text("Regular 24")
              ],
            ),
            Text('Small of the headline styles.'),
            Divider(),
            _title(context, '3. Title styles'),
            _subTitle(
                "Titles are smaller than headline styles and should be used for shorter, medium-emphasis text"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Title Large",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text("Medium 22")
              ],
            ),
            Text("Largest of the title styles"),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Title Medium",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text("Medium 16")
              ],
            ),
            Text("Medium of the title styles"),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Title Small",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text("Medium 14")
              ],
            ),
            Text("Small of the title styles"),
            Divider(),
            _title(context, '4. Body styles'),
            _subTitle('Body styles are used for longer passages of text.'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Body Large",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text("Regular 16")
              ],
            ),
            Text("Largest of the body styles"),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Body Medium (Default)",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text("Regular 14")
              ],
            ),
            Text("The default text style for [Material]."),
            Text("Medium of the body styles"),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Body Small",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text("Regular 12")
              ],
            ),
            Text("Small of the body styles"),
            Divider(),
            _title(context, '5. Label styles'),
            _subTitle(
                "Label styles are smaller, utilitarian styles, used for areas of the UI such as text inside of components or very small supporting text in the content body, like captions."),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Label Large - Button",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text("Medium 14")
              ],
            ),
            Text("Largest of the label styles."),
            Text(
                "Used for text on [ElevatedButton], [TextButton] and [OutlinedButton]"),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Label Medium",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text("Medium 12")
              ],
            ),
            Text("Medium of the label styles."),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Label Small",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text("Medium 11")
              ],
            ),
            Text("Small of the label styles."),
          ],
        ),
      ),
    );
  }
}
