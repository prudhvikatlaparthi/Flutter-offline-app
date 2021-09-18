import 'package:faker/faker.dart' as fk;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offline_app/db/entity/vehicle.dart';
import 'package:offline_app/ui/details/detail_controller.dart';

class Detail extends StatelessWidget {
  Detail({Key? key}) : super(key: key);
  final controller = Get.put(DetailController());
  final faker = fk.Faker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: controller.vehicleList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(controller.vehicleList[index].vehno),
                      );
                    },
                  );
                })
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    final customer = Vehicle('Veh-${DateTime.now().millisecondsSinceEpoch}',
                        faker.vehicle.make(), DateTime.now(), Get.arguments[0]);
                    controller.addCustomer(customer);
                  },
                  child: const Text('Save')),
            ),
          ],
        ),
      ),
    );
  }
}
