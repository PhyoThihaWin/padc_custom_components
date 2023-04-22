import 'dart:math';

import 'package:flutter/material.dart';
import 'package:padc_custom_components/resources/dimens.dart';
import 'package:padc_custom_components/utils/constants.dart';
import 'package:padc_custom_components/utils/ext.dart';

class CustomLayout extends StatefulWidget {
  @override
  State<CustomLayout> createState() => _CustomLayoutState();
}

class _CustomLayoutState extends State<CustomLayout> {
  Formations formation = Formations.FOUR_FOUR_TWO;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FootballPitchBackgroundView(),
          FormationView(formation: formation),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.red,
        onPressed: () {
          setState(() {
            formation =
                Formations.values[Random().nextInt(Formations.values.length)];
          });
        },
      ),
    );
  }
}

class FormationView extends StatelessWidget {
  final Formations formation;

  FormationView({required this.formation});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _generateFormation(formation),
    );
  }

  Widget _generateFormation(Formations formation) {
    switch (formation) {
      case Formations.FOUR_FOUR_TWO:
        return FormationViewFourFourTwo();
      case Formations.FOUR_TWO_THREE_ONE:
        return FormationViewFourTwoThreeOne();
      case Formations.FOUR_THREE_THREE:
        return FormationViewFourThreeThree();
      case Formations.THREE_FOUR_THREE:
        return FormationViewThreeFourThree();
    }
  }
}

class FormationViewThreeFourThree extends StatelessWidget {
  const FormationViewThreeFourThree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_XXLARGE + MARGIN_XLARGE),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: context.getScreenHeightBy(9)),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: context.getScreenHeightBy(9)),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: context.getScreenHeightBy(15)),
          PlayerView(isGoalKeeper: true)
        ],
      ),
    );
  }
}

class FormationViewFourThreeThree extends StatelessWidget {
  const FormationViewFourThreeThree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_XXLARGE + MARGIN_XLARGE),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: context.getScreenHeightBy(9)),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: context.getScreenHeightBy(9)),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: context.getScreenHeightBy(15)),
          PlayerView(isGoalKeeper: true)
        ],
      ),
    );
  }
}

class FormationViewFourTwoThreeOne extends StatelessWidget {
  const FormationViewFourTwoThreeOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_XXLARGE + MARGIN_XLARGE),
      child: Column(
        children: [
          PlayerView(),
          SizedBox(height: context.getScreenHeightBy(15)),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(3, (index) => PlayerView()),
          ),
          SizedBox(height: context.getScreenHeightBy(20)),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(2, (index) => PlayerView()),
          ),
          SizedBox(height: context.getScreenHeightBy(40)),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: context.getScreenHeightBy(30)),
          PlayerView(isGoalKeeper: true)
        ],
      ),
    );
  }
}

class FormationViewFourFourTwo extends StatelessWidget {
  const FormationViewFourFourTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MARGIN_XXLARGE + MARGIN_XLARGE),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(2, (index) => PlayerView()),
          ),
          SizedBox(height: context.getScreenHeightBy(10)),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: context.getScreenHeightBy(10)),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(4, (index) => PlayerView()),
          ),
          SizedBox(height: context.getScreenHeightBy(30)),
          PlayerView(isGoalKeeper: true)
        ],
      ),
    );
  }
}

class PlayerView extends StatelessWidget {
  final bool isGoalKeeper;

  PlayerView({this.isGoalKeeper = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Container(
          width: MARGIN_MEDIUM_2 * 2,
          height: MARGIN_MEDIUM_2 * 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
              color: this.isGoalKeeper ? Colors.amber : Colors.lightBlueAccent),
        ),
      ),
    );
  }
}

class FootballPitchBackgroundView extends StatelessWidget {
  const FootballPitchBackgroundView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        "assets/images/img_football_pitch.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
