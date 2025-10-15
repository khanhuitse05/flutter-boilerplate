import 'dart:async';
import 'package:flutter/material.dart';
import 'package:myapp/src/network/model/common/handle.dart';
import 'package:myapp/src/network/model/common/pagination/pagination.dart';
import 'package:myapp/widgets/common/indicator.dart';

class XStatePaginationWidget extends StatefulWidget {
  const XStatePaginationWidget({
    required this.page,
    required this.loadMore,
    this.autoLoad = true,
    super.key,
  });
  final MPagination page;
  final Function() loadMore;
  final bool autoLoad;

  @override
  State<XStatePaginationWidget> createState() => _XStatePaginationWidgetState();
}

class _XStatePaginationWidgetState extends State<XStatePaginationWidget> {
  Timer? timer;
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.page.canNext && widget.autoLoad) {
      timer?.cancel();
      timer = Timer(const Duration(milliseconds: 50), widget.loadMore);
    }
    if (widget.page.status == MStatus.loading) {
      return const XIndicator();
    } else if (widget.page.hasMore == false) {
      return const Text('');
    } else if (widget.page.status == MStatus.failure) {
      return InkWell(
        onTap: widget.loadMore,
        child: const Text(
          'Something went wrong',
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

// Use for last item of Gird
class XBoxLoadMore extends StatelessWidget {
  const XBoxLoadMore({
    required this.page,
    required this.loadMore,
    this.child,
    super.key,
  });
  final MPagination page;
  final Function() loadMore;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (page.canNext) {
      Timer(
        const Duration(milliseconds: 50),
        loadMore,
      );
    }
    return SizedBox(child: child);
  }
}
