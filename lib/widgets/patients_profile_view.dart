import 'package:flutter/material.dart';
import 'package:padc_custom_components/resources/dimens.dart';

class PatientProfileView extends StatelessWidget {
  final String imageUrl;
  final double size;

  const PatientProfileView(
      {Key? key, required this.imageUrl, this.size = MARGIN_LARGE})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MARGIN_LARGE),
      ),
      height: size,
      width: size,
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
