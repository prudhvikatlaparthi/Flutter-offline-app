import 'package:floor/floor.dart';
import 'package:offline_app/db/entity/customer.dart';

@dao
abstract class CustomerDao {
  @Query('Select * from Customer')
  Future<List<Customer>> getAllCustomers();

  @Query('SELECT * FROM Customer WHERE customerId = :customerId')
  Future<Customer?> getCustomerByID(int customerId);

  @insert
  @OnConflictStrategy.replace
  Future<int> insertCustomer(Customer customer);

  @update
  Future<int> updateCustomer(Customer customer);
}
