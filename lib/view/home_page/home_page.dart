import 'package:age_calculator/controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/daypicker.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Age Calculator")),
      body: SafeArea(
        child: Consumer<HomePageController>(builder: (context, controller, _) {
          return Center(
            child: Column(
              children: [
                daypicker(
                    selectedDate: controller.selectedDate,
                    onChanged: (DateTime selectedDate) {
                      controller.updateCalender(selectedDate);
                    },
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365000)),
                    lastDate: DateTime.now()),
                ElevatedButton(
                  onPressed: () {
                    controller.updateSelectedDate(controller.selectedDate);
                  },
                  child: const Text("Calculate age"),
                ),
                const SizedBox(
                  height: 20,
                ),
                Visibility(
                  visible: controller.ageModel.month != 0 ||
                      controller.ageModel.year != 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const Text("Calculated age is"),
                        Text(
                          controller.ageModel.year.toString(),
                          style: const TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        Text("${controller.ageModel.month.toString()} months")
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
