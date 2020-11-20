class AppAction {
  String type;
  String value;
  String name;
  String message;

  AppAction({this.type, this.value, this.name, this.message});
  AppAction.fromLink(String link){
    // todo: split link later
    type = "";
    value = "";
    name = "";
    message = "";
  }
}

class ActionType {
  static const String browser = "browser";
  static const String webView = "web-view";
  static const String screen = "screen";
}
