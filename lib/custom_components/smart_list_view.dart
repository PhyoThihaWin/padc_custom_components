import 'package:flutter/material.dart';

class SmartListView extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final EdgeInsets padding;
  final Axis scrollDirection;
  final Function onListEndReached;
  final Function onEmptyList;

  const SmartListView(
      {Key? key,
      required this.itemCount,
      required this.padding,
      required this.itemBuilder,
      required this.scrollDirection,
      required this.onListEndReached,
      required this.onEmptyList})
      : super(key: key);

  @override
  State<SmartListView> createState() => _SmartListViewState();
}

class _SmartListViewState extends State<SmartListView> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0) {
          debugPrint("Start of the List");
        } else {
          debugPrint("End of the List");
          widget.onListEndReached();
        }
      }
    });

    if (widget.itemCount == 0) {
      widget.onEmptyList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: widget.itemBuilder,
      itemCount: widget.itemCount,
      padding: widget.padding,
      controller: _controller,
      scrollDirection: widget.scrollDirection,
      shrinkWrap: true,
    );
  }
}
