import 'package:flutter/material.dart';

import '../../responsive_x.dart';
import '../../values/colors.dart';

class Skill {
  final String title;
  final double value;

  const Skill({
    required this.title,
    this.value = 0.0,
  });
}

final _skills = <Skill>[
  Skill(title: 'Flutter', value: 0.9),
  Skill(title: 'Dart', value: 0.9),
  Skill(title: 'Data Structures', value: 0.5),
  Skill(title: 'Design Patterns', value: 0.5),
  Skill(title: 'Clean Architecture', value: 0.7),
  Skill(title: 'TDD', value: 0.7),
  Skill(title: 'Unit Testing', value: 0.8),
  Skill(title: 'Firebase', value: 0.5),
  Skill(title: 'State Management', value: 0.9),
  Skill(title: 'Sentry', value: 0.5),
  Skill(title: 'Git', value: 0.75),
  Skill(title: 'CI', value: 0.5),
  Skill(title: 'Github Actions', value: 0.5),
  Skill(title: 'Bloc', value: 0.9),
  Skill(title: 'Provider', value: 0.8),
  Skill(title: 'Riverpod', value: 0.8),
  Skill(title: 'RxDart', value: 0.6),
  Skill(title: 'Node.JS', value: 0.2),
];

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveX(
      builder: (_, deviceInfo) {
        return Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Skills',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              if (deviceInfo.deviceType == DeviceType.mobile)
                ..._skills.map((skill) {
                  return SkillItem(skill: skill, deviceInfo: deviceInfo);
                }).toList()
              else
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: deviceInfo.size.width / 3,
                    mainAxisExtent: deviceInfo.size.height * 0.10,
                    crossAxisSpacing: 10,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return SkillItem(
                      skill: _skills[index],
                      deviceInfo: deviceInfo,
                    );
                  },
                  itemCount: _skills.length,
                ),
            ],
          ),
        );
      },
    );
  }
}

class SkillItem extends StatefulWidget {
  const SkillItem({
    Key? key,
    required this.skill,
    required this.deviceInfo,
  }) : super(key: key);

  final Skill skill;
  final DeviceInfo deviceInfo;

  @override
  State<SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<SkillItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: 0.0,
      upperBound: widget.skill.value,
    );

    _animationController.forward();

    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.skill.title,
          style: TextStyle(
            fontSize: widget.deviceInfo.size.shortestSide * 0.04,
          ),
        ),
        const SizedBox(height: 5.0),
        Container(
          height: widget.deviceInfo.size.height * 0.02,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4.0),
          ),
          width: double.maxFinite,
          child: Stack(
            children: [
              FractionallySizedBox(
                widthFactor: _animationController.value,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.actionColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5.0),
      ],
    );
  }
}
