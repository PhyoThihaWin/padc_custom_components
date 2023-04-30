import 'package:badges/badges.dart' as myBadge;
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:padc_custom_components/assignment/detail_page.dart';
import 'package:padc_custom_components/main.dart';
import 'package:padc_custom_components/resources/colors.dart';
import 'package:padc_custom_components/resources/dimens.dart';
import 'package:padc_custom_components/utils/constants.dart';
import 'package:padc_custom_components/custom_components/my_patients_item_view.dart';
import 'package:padc_custom_components/widgets/time_and_events_item_view.dart';

import '../custom_components/smart_list_view.dart';
import '../resources/strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final layerLink = LayerLink();
    final Map<String, String> timeList = {
      "8:00": "8:30",
      "9:00": "9:30",
      "10:00": "10:30",
      "11:00": "11:30",
      "12:00": "12:30",
      "13:00": "13:30",
      "14:00": "14:30",
      "15:00": "15:30",
      "16:00": "16:30",
      "17:00": "17:30",
      "18:00": "18:30",
      "19:00": "19:30",
    };

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Positioned.fill(
                bottom: 70,
                child: BackGroundColorView(),
              ),
              Column(
                children: [
                  SizedBox(height: 60),
                  const SearchBarAndProfileView(),
                  SizedBox(
                    height: MARGIN_XLARGE,
                  ),
                  const MyPatientsTextsAndDateDropdownView(),
                  SizedBox(
                    height: MARGIN_XLARGE,
                  ),
                  SizedBox(
                    height: 140,
                    child: SmartListView(
                      itemCount: 5,
                      padding:
                          const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () => _navigateToDetailsScreen(context),
                          child: const MyPatientsItemView(
                            borderRadius: MARGIN_MEDIUM,
                            color: SECONDARY_COLOR,
                            width: 250,
                            cardElevation: 1,
                            padding: MARGIN_MEDIUM_2,
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      onListEndReached: () => _showSnackBar(context),
                      onEmptyList: () => debugPrint(EMPTY_LIST_TEXT),
                    ),
                  )
                ],
              )
            ],
          ),
          Expanded(
              child: Stack(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => _refresh(),
                  child: SmartListView(
                    itemCount: timeList.length,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    onListEndReached: () => _showSnackBar(context),
                    onEmptyList: () => debugPrint(EMPTY_LIST_TEXT),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if (!(index == 0)) {
                            _navigateToDetailsScreen(context);
                          }
                        },
                        child: TimeAndEventsItemView(
                          layerLink: layerLink,
                          timeList: timeList,
                          index: index,
                        ),
                      );
                    },
                  ),
                ),
              ),
              CompositedTransformFollower(
                link: layerLink,
                showWhenUnlinked: false,
                offset: const Offset(-MARGIN_MEDIUM, -MARGIN_MEDIUM),
                targetAnchor: Alignment.bottomCenter,
                child: const CurrentTImeIndicator(),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Future<void> _refresh() async {
    return Future.delayed(
      const Duration(seconds: 2),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _showSnackBar(
      BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.black,
        content: Text(
          END_LIST_DIALOG_TEXT,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Future<dynamic> _navigateToDetailsScreen(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DetailPage(),
      ),
    );
  }
}

class MyPatientsTextsAndDateDropdownView extends StatelessWidget {
  const MyPatientsTextsAndDateDropdownView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          MyPatientsAndTotalPatientsTextsView(),
          DateDropdownView()
        ],
      ),
    );
  }
}

class DateDropdownView extends StatelessWidget {
  const DateDropdownView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_10, vertical: MARGIN_6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_6),
          color: LIGHT_BLUE_COLOR),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              HOME_PAGE_DATE_TEXT,
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

class MyPatientsAndTotalPatientsTextsView extends StatelessWidget {
  const MyPatientsAndTotalPatientsTextsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        MyPatientsTextView(),
        TotalPatientsTextView(),
      ],
    );
  }
}

class TotalPatientsTextView extends StatelessWidget {
  const TotalPatientsTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      HOME_PAGE_TOTAL_PATIENTS_TEXT,
      style: TextStyle(color: Colors.white70, fontSize: TEXT_REGULAR),
    );
  }
}

class MyPatientsTextView extends StatelessWidget {
  const MyPatientsTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      HOME_PAGE_MY_PATIENTS_TEXT,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: TEXT_REGULAR_2X),
    );
  }
}

class SearchBarAndProfileView extends StatelessWidget {
  const SearchBarAndProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Expanded(child: SearchFieldView()),
          SizedBox(width: MARGIN_MEDIUM_2),
          ProfileImageView(),
        ],
      ),
    );
  }
}

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return myBadge.Badge(
      badgeContent: Text(
        "2",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
      badgeStyle: const myBadge.BadgeStyle(),
      child: Container(
        height: PROFILE_CIRCLE_SIZE,
        width: PROFILE_CIRCLE_SIZE,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(PROFILE_CIRCLE_SIZE),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(MARGIN_SMALL),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM_3),
            ),
            child: Image.network(
              PATIENT_TWO,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class SearchFieldView extends StatelessWidget {
  const SearchFieldView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(MARGIN_XLARGE),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3, vertical: MARGIN_10),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: HOME_PAGE_SEARCH_FIELD_TEXT,
          hintStyle:
              TextStyle(color: Colors.white54, fontWeight: FontWeight.w500),
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.white54,
          ),
        ),
      ),
    );
  }
}

class BackGroundColorView extends StatelessWidget {
  const BackGroundColorView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            HOME_SCREEN_GRADIENT_COLOR_ONE,
            HOME_SCREEN_GRADIENT_COLOR_TWO
          ],
        ),
      ),
    );
  }
}
