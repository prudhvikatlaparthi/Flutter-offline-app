import 'package:offline_app/db/db_operations.dart';
import 'package:offline_app/repository/api_repository.dart';

import '../sync_customer.dart';
import '../sync_vehicle.dart';

Future<void> uploadSync(DBOperations db, ApiRepository apiRepository) async {
  final tables = <String>[];
  tables.add('customer');
  tables.add('vehicle');

  await Future.forEach(tables, (String table) async {
    switch (table) {
      case 'customer':
        {
          await uploadCustomerSync(db, apiRepository);
        }
        break;
      case 'vehicle':
        {
          await uploadVehicleSync(db, apiRepository);
        }
        break;
    }
  });
}
