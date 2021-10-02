part of 'dialog_service.dart';

class DialogModel {
  String? title;
  String? body;
  Widget? titleWidget;
  Widget? bodyWidget;
  List<DialogButton>? actions;
  late DialogType type;

  DialogModel({
    this.title,
    this.body,
    this.titleWidget,
    this.bodyWidget,
    this.actions,
  }) {
    type = DialogType.normal;
  }

  DialogModel.loading({this.body}) {
    type = DialogType.loading;
  }
}

class DialogButton {
  final String title;
  final Function? onPressed;
  final Key? key;
  DialogButton(this.title, {this.key, this.onPressed});
  DialogButton.close({this.title = 'Close', this.key, this.onPressed});
}

enum DialogType { normal, loading }
