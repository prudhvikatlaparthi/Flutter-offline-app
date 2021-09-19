enum Method { GET, POST, PUT, DELETE }

extension MethodType on Method {
  String getValue() {
    return toString().split('.').last;
  }
}

const kAddCustomer = '/addcustomer';
const kAddVehicle = '/addvechile';
const kGetCustomers = '/viewcustomers';
const kGetVehicles = '/viewvechiles';