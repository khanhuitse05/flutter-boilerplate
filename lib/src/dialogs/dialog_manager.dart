part of 'dialog_service.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({this.child, Key? key}) : super(key: key);
  final Widget? child;

  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  @override
  void initState() {
    super.initState();
    DialogService.showDialogListener = _showDialog;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? SizedBox.shrink();
  }

  Future _showDialog(DialogModel request) async {
    if (request.type == DialogType.loading) {
      return _showLoading(request);
    } else {
      return _showNormalDialog(request);
    }
  }

  Future _showLoading(DialogModel request) async {
    final _dialogMessage = request.body ?? '';
    showDialog<dynamic>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              width: _dialogMessage.isEmpty ? 80 : 130,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 80,
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Platform.isIOS
                        ? const CupertinoActivityIndicator(
                            radius: 15,
                          )
                        : SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation(
                                  Theme.of(context).primaryColor),
                            ),
                          ),
                  ),

                  /// Bottom
                  if (_dialogMessage.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                      width: double.infinity,
                      child: Text(
                        _dialogMessage,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showNormalDialog(DialogModel request) {
    showDialog(
      context: context,
      builder: (context) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            title: request.titleWidget ??
                (request.title == null ? null : Text(request.title!)),
            content: request.bodyWidget ??
                (request.body == null ? null : Text(request.body!)),
            actions: <Widget>[
              for (final DialogButton item in request.actions ?? [])
                CupertinoDialogAction(
                  key: item.key,
                  onPressed: () {
                    DialogService.pop();
                    item.onPressed?.call();
                  },
                  child: Text(item.title),
                ),
            ],
          );
        }
        return AlertDialog(
          title: request.titleWidget ??
              (request.title == null ? null : Text(request.title!)),
          content: request.bodyWidget ??
              (request.body == null ? null : Text(request.body!)),
          actions: <Widget>[
            for (final DialogButton item in request.actions ?? [])
              TextButton(
                onPressed: () {
                  DialogService.pop();
                  item.onPressed?.call();
                },
                child: Text(item.title),
              ),
          ],
        );
      },
    );
  }
}
