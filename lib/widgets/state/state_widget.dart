import 'package:flutter/material.dart';
import 'package:my_app/src/network/model/common/handle.dart';
import 'package:my_app/widgets/state/state_error_widget.dart';
import 'package:my_app/widgets/state/state_loading_widget.dart';

class XStateWidget extends StatelessWidget {
  const XStateWidget(this.handle, {this.onReload, this.child, Key? key})
      : super(key: key);
  final XHandle handle;
  final Widget? child;
  final VoidCallback? onReload;
  @override
  Widget build(BuildContext context) {
    if (handle.isLoading) {
      return XStateLoadingWidget();
    } else if (handle.isCompleted) {
      return child ?? Text('Success');
    }
    return XStateErrorWidget(onReload: onReload);
  }
}
