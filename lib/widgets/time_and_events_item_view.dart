import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:padc_custom_components/resources/dimens.dart';

import '../custom_components/my_patients_item_view.dart';
import '../resources/colors.dart';
import '../resources/strings.dart';

class TimeAndEventsItemView extends StatelessWidget {
  const TimeAndEventsItemView(
      {Key? key,
      required this.layerLink,
      required this.timeList,
      required this.index})
      : super(key: key);

  final Map<String, String> timeList;
  final LayerLink layerLink;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (index == 0) ? Colors.white.withOpacity(0.1) : Colors.black12,
      child: Column(
        children: [
          Visibility(
            visible: (index == 0),
            child: TimeAndEventsTitleView(),
          ),
          DateTimeDottedLineAndEventsCardView(
            timeList: timeList,
            layerLink: layerLink,
            index: index,
          ),
        ],
      ),
    );
  }
}

class DateTimeDottedLineAndEventsCardView extends StatelessWidget {
  const DateTimeDottedLineAndEventsCardView({
    Key? key,
    required this.index,
    required this.layerLink,
    required this.timeList,
  }) : super(key: key);

  final Map<String, String> timeList;
  final LayerLink layerLink;
  final int index;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          DateTimeView(
            timeList: timeList,
            index: index,
          ),
          const SizedBox(
            width: MARGIN_MEDIUM_3,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              DottedTimeLine(
                index: index,
              ),
              Visibility(
                visible: (index == 0),
                child: CompositedTransformTarget(
                  link: layerLink,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: MARGIN_MEDIUM_3,
          ),
          EventsCardView(
            index: index,
          )
        ],
      ),
    );
  }
}

class DottedTimeLine extends StatelessWidget {
  final int index;

  const DottedTimeLine({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: DottedLine(
        lineLength: MARGIN_XXLARGE * 2,
        dashLength: (index == 0) ? MARGIN_6 : MARGIN_XXLARGE * 2,
        dashColor: (index == 0) ? PRIMARY_COLOR : Colors.black26,
        direction: Axis.vertical,
      ),
    );
  }
}

class CurrentTImeIndicator extends StatelessWidget {
  const CurrentTImeIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_MEDIUM_2,
      width: MARGIN_MEDIUM_2,
      padding: const EdgeInsets.all(MARGIN_XSMALL),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(MARGIN_10),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: PRIMARY_COLOR,
          borderRadius: BorderRadius.circular(MARGIN_10),
        ),
      ),
    );
  }
}

class EventsCardView extends StatelessWidget {
  const EventsCardView({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MARGIN_10),
      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 70,
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EventIconView(
              index: index,
            ),
            const SizedBox(
              width: MARGIN_MEDIUM_3,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PatientNameView(
                  index: index,
                ),
                const SizedBox(
                  height: 5,
                ),
                SubtitleView(
                  isDetail: false,
                  color: (index == 0) ? Colors.black26 : Colors.grey,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PatientNameView extends StatelessWidget {
  const PatientNameView({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      HOME_PAGE_PATIENT_NAME_TEXT,
      style: TextStyle(
          color: (index == 0) ? Colors.black26 : Colors.black,
          fontWeight: FontWeight.w600),
    );
  }
}

class EventIconView extends StatelessWidget {
  const EventIconView({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_XLARGE,
      width: MARGIN_XLARGE,
      decoration: BoxDecoration(
        color: (index == 0)
            ? HOME_SCREEN_DISABLED_ICON_BACKGROUND_COLOR
            : HOME_SCREEN_ICON_BACKGROUND_COLOR,
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
      ),
      child: Icon(
        Icons.app_registration,
        size: MARGIN_MEDIUM_2,
        color: (index == 0) ? Colors.grey : SECONDARY_COLOR,
      ),
    );
  }
}

class DateTimeView extends StatelessWidget {
  const DateTimeView({Key? key, required this.timeList, required this.index})
      : super(key: key);

  final Map<String, String> timeList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2),
      width: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            timeList.keys.elementAt(index),
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            timeList.values.elementAt(index),
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class TimeAndEventsTitleView extends StatelessWidget {
  const TimeAndEventsTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.1),
      margin: EdgeInsets.only(top: MARGIN_XLARGE),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            width: 60,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                HOME_PAGE_TIME_TEXT,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            width: MARGIN_MEDIUM_3,
          ),
          Padding(
            padding: EdgeInsets.only(top: MARGIN_SMALL),
            child: DottedLine(
              direction: Axis.vertical,
              dashColor: PRIMARY_COLOR,
              dashLength: MARGIN_6,
              lineLength: MARGIN_LARGE,
            ),
          ),
          SizedBox(
            width: MARGIN_MEDIUM_3,
          ),
          Text(
            HOME_PAGE_EVENTS_TEXT,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
