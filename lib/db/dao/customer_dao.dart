import 'package:floor/floor.dart';
import 'package:offline_app/db/entity/customer.dart';

@dao
abstract class CustomerDao {
  @Query('Select * from Customer')
  Future<List<Customer>> getAllCustomers();

  @Query('SELECT * FROM Customer WHERE customerId = :customerId')
  Future<Customer?> getCustomerByID(int customerId);

  @Query('SELECT * FROM Customer WHERE customerId = :customerId')
  Future<Customer?> getWebCustomerID(String customerId);

  @Query('SELECT * FROM Customer WHERE webCustomerId = :webCustomerId')
  Future<Customer?> getCustomerByWebID(int webCustomerId);

  @Query('SELECT * FROM Customer WHERE isSync = :isSync')
  Future<List<Customer>> getCustomerBySyncFlag(int isSync);

  @insert
  @OnConflictStrategy.replace
  Future<int> insertCustomer(Customer customer);

  @update
  Future<int> updateCustomer(Customer customer);

  @Query('UPDATE Customer SET isSync = :sync, webCustomerId = :webID WHERE customerId = :customerId ')
  Future<int?> updateSyncWebID(int sync, int webID, String customerId);
}
