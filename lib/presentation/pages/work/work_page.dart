import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/hovered_item.dart';
import 'widgets/responsive_multi_item_builder.dart';

class Work {
  Work({
    required this.title,
    required this.imagePath,
  });

  final String imagePath;
  final String title;
}

class WorkPage extends StatefulWidget {
  @override
  _WorkPageState createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  final controller = PageController(initialPage: 0);
  int selection = 0;

  final works = [
    Work(
      imagePath: 'lib/assets/bmi_calculator.png',
      title: 'BMI Calculator',
    ),
    Work(
      imagePath: 'lib/assets/corona_tracker.png',
      title: 'Corona Tracker',
    ),
    Work(
      imagePath: 'lib/assets/i_read_quran.png',
      title: 'Mən Quran oxuyuram',
    ),
    Work(
      imagePath: 'lib/assets/travelx.png',
      title: 'TravelX',
    ),
  ];

  final blog = [
    'Blog 1',
    'Blog 2',
    'Blog 3',
    'Blog 4',
    'Blog 5',
    'Blog 6',
    'Blog 7',
    'Blog 8',
    'Blog 9',
    'Blog 10',
    'Blog 11',
  ];

  @override
  void didChangeDependencies() {
    controller.addListener(() {
      final currentPage = controller.page?.round();

      if (currentPage != selection) {
        setState(() {
          selection = currentPage!;
        });
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CupertinoSlidingSegmentedControl<int>(
                  children: {
                    0: Text('My Works'),
                    1: Text('Blog'),
                  },
                  groupValue: selection,
                  onValueChanged: (newSelection) {
                    setState(() {
                      selection = newSelection!;
                    });
                    controller.animateToPage(
                      selection,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: PageView(
                  controller: controller,
                  children: [
                    ResponsiveMultiChildBuilder(
                      itemBuilder: (_, index) {
                        final work = works[index];

                        return HoveredWorkItem(
                          title: work.title,
                          imagePath: work.imagePath,
                          externalUrl: work.imagePath,
                        );
                      },
                      itemCount: works.length,
                    ),
                    ResponsiveMultiChildBuilder(
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 4.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withOpacity(
                                  0.3,
                                ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Center(
                            child: Text(
                              blog[index],
                            ),
                          ),
                        );
                      },
                      itemCount: blog.length,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
