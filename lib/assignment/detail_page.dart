import 'package:flutter/material.dart';
import 'package:padc_custom_components/custom_components/my_patients_item_view.dart';
import 'package:padc_custom_components/resources/dimens.dart';

import '../custom_components/smart_list_view.dart';
import '../resources/colors.dart';
import '../resources/strings.dart';
import '../utils/constants.dart';
import '../widgets/patients_profile_view.dart';
import 'custom_painter/custom_paint_circle.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundColorView(),
          Container(
            margin: const EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                AppBarView(),
                AppointmentListView(),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Padding(
                padding: EdgeInsets.only(bottom: 80),
                child: CustomCirclePaint()),
          ),
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(bottom: 80),
              child: CurrentClockTimeView(),
            ),
          ),
          const Positioned(
            top: 500,
            left: 40,
            child: ClockProfileIconView(
              url: PATIENT_TWO,
            ),
          ),
          const Positioned(
            top: 580,
            left: 0,
            right: 0,
            child: Center(
              child: ClockProfileIconView(
                url: PATIENT_THREE,
              ),
            ),
          ),
          const Positioned(
            top: 300,
            right: 40,
            child: ClockProfileIconView(
              url: PATIENT_ONE,
            ),
          ),
        ],
      ),
    );
  }
}

class CurrentClockTimeView extends StatelessWidget {
  const CurrentClockTimeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text(
          DETAILS_PAGE_TIME,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: TEXT_BIG),
        ),
        Text(
          DETAILS_PAGE_TIME_PM,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
              fontSize: TEXT_REGULAR_4X),
        ),
      ],
    );
  }
}

class ClockProfileIconView extends StatelessWidget {
  final String url;

  const ClockProfileIconView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_XXLARGE,
      width: MARGIN_XXLARGE,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(MARGIN_LARGE),
      ),
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_SMALL),
        child: PatientProfileView(
          imageUrl: url,
        ),
      ),
    );
  }
}

class AppBarView extends StatelessWidget {
  const AppBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                BackArrowView(),
                SearchAndMenuIconsView(),
              ],
            ),
            const TitleText(),
          ],
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        const OfficeNameAndTotalPatientsColumnView(),
      ],
    );
  }
}

class OfficeNameAndTotalPatientsColumnView extends StatelessWidget {
  const OfficeNameAndTotalPatientsColumnView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: MARGIN_XLARGE,
          ),
          Text(
            DETAILS_PAGE_OFFICE_NUMBER_TEXT,
            style: TextStyle(
                fontSize: TEXT_REGULAR_4X,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
          Text(
            DETAILS_PAGE_TOTAL_PATIENTS_TEXT,
            style: TextStyle(
              fontSize: TEXT_REGULAR,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchAndMenuIconsView extends StatelessWidget {
  const SearchAndMenuIconsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.search,
          size: MARGIN_LARGE,
          color: Colors.white,
        ),
        SizedBox(
          width: MARGIN_10,
        ),
        Icon(
          Icons.menu,
          color: Colors.white,
          size: MARGIN_XLARGE,
        ),
        SizedBox(
          width: MARGIN_MEDIUM_3,
        )
      ],
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      DETAILS_PAGE_TITLE_TEXT,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: TEXT_REGULAR_4X),
    );
  }
}

class BackArrowView extends StatelessWidget {
  const BackArrowView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Row(
        children: const [
          SizedBox(
            width: MARGIN_MEDIUM_3,
          ),
          Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: MARGIN_XLARGE,
          ),
        ],
      ),
    );
  }
}

class AppBarLeadingView extends StatelessWidget {
  const AppBarLeadingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.keyboard_arrow_left,
      size: MARGIN_XLARGE,
    );
  }
}

class AppointmentListView extends StatelessWidget {
  const AppointmentListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: SmartListView(
            itemCount: 5,
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
            itemBuilder: (context, index) {
              return const MyPatientsItemView(
                isDetail: true,
                borderRadius: MARGIN_10,
                color: Colors.white,
                width: 280,
                padding: MARGIN_MEDIUM_2,
                cardElevation: 1,
              );
            },
            scrollDirection: Axis.horizontal,
            onListEndReached: () => _showSnackBar(context),
            onEmptyList: () => debugPrint(EMPTY_LIST_TEXT),
          ),
        ),
        const SizedBox(
          height: MARGIN_XXLARGE,
        )
      ],
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        backgroundColor: PRIMARY_COLOR,
        content: Text(
          END_LIST_DIALOG_TEXT,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class BackgroundColorView extends StatelessWidget {
  const BackgroundColorView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  DETAILS_SCREEN_GRADIENT_COLOR_ONE,
                  DETAILS_SCREEN_GRADIENT_COLOR_TWO
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: PRIMARY_COLOR,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: TERTIARY_COLOR,
          ),
        ),
      ],
    );
  }
}
