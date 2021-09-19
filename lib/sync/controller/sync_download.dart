import 'package:offline_app/db/db_operations.dart';
import 'package:offline_app/repository/api_repository.dart';
import 'package:offline_app/sync/sync_vehicle.dart';

import '../sync_customer.dart';

Future<void> downloadSync(DBOperations db, ApiRepository apiRepository) async {
  final tables = <String>[];
  tables.add('customer');
  tables.add('vehicle');

  await Future.forEach(tables, (String table) async {
    switch (table) {
      case 'customer':
        {
          await downloadCustomerSync(db, apiRepository);
        }
        break;
      case 'vehicle':
        {
          await downloadVehicleSync(db, apiRepository);
        }
        break;
    }
  });
}
