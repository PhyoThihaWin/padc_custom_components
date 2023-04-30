import 'package:flutter/material.dart';
import 'package:padc_custom_components/resources/dimens.dart';
import 'package:padc_custom_components/widgets/patients_profile_view.dart';

import '../resources/strings.dart';
import '../utils/constants.dart';

class MyPatientsItemView extends StatelessWidget {
  final bool isDetail;
  final double padding;
  final double width;
  final Color color;
  final double borderRadius;
  final double cardElevation;

  const MyPatientsItemView({
    Key? key,
    this.isDetail = false,
    required this.borderRadius,
    required this.color,
    required this.width,
    required this.padding,
    required this.cardElevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: cardElevation,
        child: Row(
          children: [
            Visibility(
              visible: !isDetail,
              child: Container(
                width: MARGIN_MEDIUM,
                color: Colors.blue,
              ),
            ),
            Container(
              width: width,
              padding: EdgeInsets.symmetric(horizontal: padding),
              decoration: BoxDecoration(color: color),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleView(
                    isDetail: isDetail,
                  ),
                  const SizedBox(
                    height: MARGIN_MEDIUM,
                  ),
                  SubtitleView(
                    isDetail: isDetail,
                    color: Colors.white70,
                  ),
                  const SizedBox(
                    height: MARGIN_MEDIUM,
                  ),
                  Visibility(
                    visible: isDetail,
                    child: const DescriptionView(),
                  ),
                  const SizedBox(
                    height: MARGIN_MEDIUM,
                  ),
                  PatientsAndCheckRowView(isDetail: isDetail)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PatientsAndCheckRowView extends StatelessWidget {
  const PatientsAndCheckRowView({
    Key? key,
    required this.isDetail,
  }) : super(key: key);

  final bool isDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const PatientProfileView(
          imageUrl: PATIENT_ONE,
        ),
        const SizedBox(
          width: MARGIN_6,
        ),
        const PatientProfileView(
          imageUrl: PATIENT_TWO,
        ),
        const SizedBox(
          width: MARGIN_6,
        ),
        const PatientProfileView(
          imageUrl: PATIENT_THREE,
        ),
        const Spacer(),
        Visibility(
          visible: !isDetail,
          child: const CheckIconView(),
        )
      ],
    );
  }
}

class CheckIconView extends StatelessWidget {
  const CheckIconView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MARGIN_MEDIUM_3,
      width: MARGIN_MEDIUM_3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_10), color: Colors.blue),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: MARGIN_MEDIUM_2,
      ),
    );
  }
}

class DescriptionView extends StatelessWidget {
  const DescriptionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      DETAILS_PAGE_DESCRIPTION,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black26,
          fontSize: TEXT_SMALL),
      textAlign: TextAlign.start,
    );
  }
}

class TitleView extends StatelessWidget {
  final bool isDetail;

  const TitleView({Key? key, required this.isDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isDetail
        ? OfficeNameAndTotalPatientsView(isDetail)
        : Text(
            HOME_PAGE_LIST_VIEW_TITLE_TEXT,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          );
  }
}

class SubtitleView extends StatelessWidget {
  final bool isDetail;
  final Color color;

  const SubtitleView(
      {Key? key, required this.isDetail, this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isDetail
        ? Text(
            DETAILS_PAGE_TEETH_DRILLING,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: MARGIN_MEDIUM_2,
                color: Colors.black),
          )
        : Row(
            children: [
              Icon(
                Icons.access_time,
                color: color,
                size: MARGIN_MEDIUM_2,
              ),
              const SizedBox(
                width: MARGIN_MEDIUM_2,
              ),
              Text(
                TO_DO_DATETIME_TEXT,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w500,
                  fontSize: TEXT_SMALL,
                ),
              ),
            ],
          );
  }
}

class OfficeNameAndTotalPatientsView extends StatelessWidget {
  final bool isDetail;

  OfficeNameAndTotalPatientsView(this.isDetail);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            const Icon(
              Icons.access_time,
              color: Colors.black38,
              size: MARGIN_MEDIUM_2,
            ),
            SizedBox(width: MARGIN_MEDIUM),
            Text(
              "8:30 AM - 02:00 PM",
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: TEXT_REGULAR,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Visibility(
          visible: isDetail,
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: MARGIN_SMALL, horizontal: MARGIN_MEDIUM),
            decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(MARGIN_SMALL)),
            child: Text(
              "Confirmed",
              style: TextStyle(color: Colors.green, fontSize: TEXT_XSMALL),
            ),
          ),
        )
      ],
    );
  }
}
