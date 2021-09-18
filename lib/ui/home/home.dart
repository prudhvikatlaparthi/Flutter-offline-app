import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:offline_app/db/db_operations.dart';
import 'package:offline_app/ui/details/detail.dart';

import '../../db/dao/customer_dao.dart';
import '../../db/entity/customer.dart';
import 'home_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = Get.put(HomeController());
  final faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.customerList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        Get.to(() => Detail(),arguments: [controller.customerList[index].customerId]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(controller.customerList[index].name),
                      ),
                    );
                  },
                );
              })
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    final customer = Customer('CRM-${DateTime.now().millisecondsSinceEpoch}',
                        faker.person.name(), DateTime.now(),email: faker.internet.email());
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
