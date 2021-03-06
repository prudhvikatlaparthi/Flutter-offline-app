// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CustomerDao? _customerDaoInstance;

  VehicleDao? _vehicleDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 3,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Customer` (`customerId` TEXT NOT NULL, `name` TEXT NOT NULL, `email` TEXT, `webCustomerId` INTEGER NOT NULL, `isSync` INTEGER NOT NULL, `updatedDT` INTEGER NOT NULL, PRIMARY KEY (`customerId`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Vehicle` (`vehicleId` TEXT NOT NULL, `vehno` TEXT NOT NULL, `webVehicleId` INTEGER NOT NULL, `isSync` INTEGER NOT NULL, `updatedDT` INTEGER NOT NULL, `customerId` TEXT NOT NULL, FOREIGN KEY (`customerId`) REFERENCES `Customer` (`customerId`) ON UPDATE NO ACTION ON DELETE NO ACTION, PRIMARY KEY (`vehicleId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CustomerDao get customerDao {
    return _customerDaoInstance ??= _$CustomerDao(database, changeListener);
  }

  @override
  VehicleDao get vehicleDao {
    return _vehicleDaoInstance ??= _$VehicleDao(database, changeListener);
  }
}

class _$CustomerDao extends CustomerDao {
  _$CustomerDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _customerInsertionAdapter = InsertionAdapter(
            database,
            'Customer',
            (Customer item) => <String, Object?>{
                  'customerId': item.customerId,
                  'name': item.name,
                  'email': item.email,
                  'webCustomerId': item.webCustomerId,
                  'isSync': item.isSync,
                  'updatedDT': _dateTimeConverter.encode(item.updatedDT)
                }),
        _customerUpdateAdapter = UpdateAdapter(
            database,
            'Customer',
            ['customerId'],
            (Customer item) => <String, Object?>{
                  'customerId': item.customerId,
                  'name': item.name,
                  'email': item.email,
                  'webCustomerId': item.webCustomerId,
                  'isSync': item.isSync,
                  'updatedDT': _dateTimeConverter.encode(item.updatedDT)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Customer> _customerInsertionAdapter;

  final UpdateAdapter<Customer> _customerUpdateAdapter;

  @override
  Future<List<Customer>> getAllCustomers() async {
    return _queryAdapter.queryList('Select * from Customer',
        mapper: (Map<String, Object?> row) => Customer(
            row['customerId'] as String,
            row['name'] as String,
            _dateTimeConverter.decode(row['updatedDT'] as int),
            webCustomerId: row['webCustomerId'] as int,
            isSync: row['isSync'] as int,
            email: row['email'] as String?));
  }

  @override
  Future<Customer?> getCustomerByID(int customerId) async {
    return _queryAdapter.query('SELECT * FROM Customer WHERE customerId = ?1',
        mapper: (Map<String, Object?> row) => Customer(
            row['customerId'] as String,
            row['name'] as String,
            _dateTimeConverter.decode(row['updatedDT'] as int),
            webCustomerId: row['webCustomerId'] as int,
            isSync: row['isSync'] as int,
            email: row['email'] as String?),
        arguments: [customerId]);
  }

  @override
  Future<Customer?> getWebCustomerID(String customerId) async {
    return _queryAdapter.query('SELECT * FROM Customer WHERE customerId = ?1',
        mapper: (Map<String, Object?> row) => Customer(
            row['customerId'] as String,
            row['name'] as String,
            _dateTimeConverter.decode(row['updatedDT'] as int),
            webCustomerId: row['webCustomerId'] as int,
            isSync: row['isSync'] as int,
            email: row['email'] as String?),
        arguments: [customerId]);
  }

  @override
  Future<Customer?> getCustomerByWebID(int webCustomerId) async {
    return _queryAdapter.query(
        'SELECT * FROM Customer WHERE webCustomerId = ?1',
        mapper: (Map<String, Object?> row) => Customer(
            row['customerId'] as String,
            row['name'] as String,
            _dateTimeConverter.decode(row['updatedDT'] as int),
            webCustomerId: row['webCustomerId'] as int,
            isSync: row['isSync'] as int,
            email: row['email'] as String?),
        arguments: [webCustomerId]);
  }

  @override
  Future<List<Customer>> getCustomerBySyncFlag(int isSync) async {
    return _queryAdapter.queryList('SELECT * FROM Customer WHERE isSync = ?1',
        mapper: (Map<String, Object?> row) => Customer(
            row['customerId'] as String,
            row['name'] as String,
            _dateTimeConverter.decode(row['updatedDT'] as int),
            webCustomerId: row['webCustomerId'] as int,
            isSync: row['isSync'] as int,
            email: row['email'] as String?),
        arguments: [isSync]);
  }

  @override
  Future<int?> updateSyncWebID(int sync, int webID, String customerId) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE Customer SET isSync = ?1, webCustomerId = ?2 WHERE customerId = ?3',
        arguments: [sync, webID, customerId]);
  }

  @override
  Future<int> insertCustomer(Customer customer) {
    return _customerInsertionAdapter.insertAndReturnId(
        customer, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateCustomer(Customer customer) {
    return _customerUpdateAdapter.updateAndReturnChangedRows(
        customer, OnConflictStrategy.abort);
  }
}

class _$VehicleDao extends VehicleDao {
  _$VehicleDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _vehicleInsertionAdapter = InsertionAdapter(
            database,
            'Vehicle',
            (Vehicle item) => <String, Object?>{
                  'vehicleId': item.vehicleId,
                  'vehno': item.vehno,
                  'webVehicleId': item.webVehicleId,
                  'isSync': item.isSync,
                  'updatedDT': _dateTimeConverter.encode(item.updatedDT),
                  'customerId': item.customerId
                }),
        _vehicleUpdateAdapter = UpdateAdapter(
            database,
            'Vehicle',
            ['vehicleId'],
            (Vehicle item) => <String, Object?>{
                  'vehicleId': item.vehicleId,
                  'vehno': item.vehno,
                  'webVehicleId': item.webVehicleId,
                  'isSync': item.isSync,
                  'updatedDT': _dateTimeConverter.encode(item.updatedDT),
                  'customerId': item.customerId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Vehicle> _vehicleInsertionAdapter;

  final UpdateAdapter<Vehicle> _vehicleUpdateAdapter;

  @override
  Future<List<Vehicle>> getAllCustomers() async {
    return _queryAdapter.queryList('Select * from Vehicle',
        mapper: (Map<String, Object?> row) => Vehicle(
            row['vehicleId'] as String,
            row['vehno'] as String,
            _dateTimeConverter.decode(row['updatedDT'] as int),
            row['customerId'] as String,
            webVehicleId: row['webVehicleId'] as int,
            isSync: row['isSync'] as int));
  }

  @override
  Future<Vehicle?> getVehicleByID(int vehicleId) async {
    return _queryAdapter.query('SELECT * FROM Vehicle WHERE vehicleId = ?1',
        mapper: (Map<String, Object?> row) => Vehicle(
            row['vehicleId'] as String,
            row['vehno'] as String,
            _dateTimeConverter.decode(row['updatedDT'] as int),
            row['customerId'] as String,
            webVehicleId: row['webVehicleId'] as int,
            isSync: row['isSync'] as int),
        arguments: [vehicleId]);
  }

  @override
  Future<List<Vehicle>> getVehiclesByCustomerID(String customerId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM Vehicle WHERE customerId = ?1',
        mapper: (Map<String, Object?> row) => Vehicle(
            row['vehicleId'] as String,
            row['vehno'] as String,
            _dateTimeConverter.decode(row['updatedDT'] as int),
            row['customerId'] as String,
            webVehicleId: row['webVehicleId'] as int,
            isSync: row['isSync'] as int),
        arguments: [customerId]);
  }

  @override
  Future<Vehicle?> getVehicleByWebID(int webVehicleId) async {
    return _queryAdapter.query('SELECT * FROM Vehicle WHERE webVehicleId = ?1',
        mapper: (Map<String, Object?> row) => Vehicle(
            row['vehicleId'] as String,
            row['vehno'] as String,
            _dateTimeConverter.decode(row['updatedDT'] as int),
            row['customerId'] as String,
            webVehicleId: row['webVehicleId'] as int,
            isSync: row['isSync'] as int),
        arguments: [webVehicleId]);
  }

  @override
  Future<List<Vehicle>> getVehicleBySyncFlag(int isSync) async {
    return _queryAdapter.queryList('SELECT * FROM Vehicle WHERE isSync = ?1',
        mapper: (Map<String, Object?> row) => Vehicle(
            row['vehicleId'] as String,
            row['vehno'] as String,
            _dateTimeConverter.decode(row['updatedDT'] as int),
            row['customerId'] as String,
            webVehicleId: row['webVehicleId'] as int,
            isSync: row['isSync'] as int),
        arguments: [isSync]);
  }

  @override
  Future<int?> updateSyncWebID(int sync, int webID, String vehicleId) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE Vehicle SET isSync = ?1, webVehicleId = ?2 WHERE vehicleId = ?3',
        arguments: [sync, webID, vehicleId]);
  }

  @override
  Future<int> insertVehicle(Vehicle vehicle) {
    return _vehicleInsertionAdapter.insertAndReturnId(
        vehicle, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateVehicle(Vehicle vehicle) {
    return _vehicleUpdateAdapter.updateAndReturnChangedRows(
        vehicle, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
