// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseBuilder databaseBuilder(String name) =>
      _$AppDataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDataBaseBuilder(null);
}

class _$AppDataBaseBuilder {
  _$AppDataBaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDataBaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDataBaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDataBase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDataBase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDataBase extends AppDataBase {
  _$AppDataBase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FlickrImageDao? _flickrImageDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
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
            'CREATE TABLE IF NOT EXISTS `FlickrImageEntity` (`id` TEXT NOT NULL, `title` TEXT NOT NULL, `secret` TEXT NOT NULL, `server` TEXT NOT NULL, `farm` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FlickrImageDao get flickrImageDao {
    return _flickrImageDaoInstance ??=
        _$FlickrImageDao(database, changeListener);
  }
}

class _$FlickrImageDao extends FlickrImageDao {
  _$FlickrImageDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _flickrImageEntityInsertionAdapter = InsertionAdapter(
            database,
            'FlickrImageEntity',
            (FlickrImageEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'secret': item.secret,
                  'server': item.server,
                  'farm': item.farm
                }),
        _flickrImageEntityDeletionAdapter = DeletionAdapter(
            database,
            'FlickrImageEntity',
            ['id'],
            (FlickrImageEntity item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'secret': item.secret,
                  'server': item.server,
                  'farm': item.farm
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FlickrImageEntity> _flickrImageEntityInsertionAdapter;

  final DeletionAdapter<FlickrImageEntity> _flickrImageEntityDeletionAdapter;

  @override
  Future<List<FlickrImageEntity>> getAllImage() async {
    return _queryAdapter.queryList('SELECT * FROM FlickrImageEntity',
        mapper: (Map<String, Object?> row) => FlickrImageEntity(
            id: row['id'] as String,
            title: row['title'] as String,
            secret: row['secret'] as String,
            server: row['server'] as String,
            farm: row['farm'] as int));
  }

  @override
  Future<void> insertImage(FlickrImageEntity flickrImage) async {
    await _flickrImageEntityInsertionAdapter.insert(
        flickrImage, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteImage(FlickrImageEntity flickrImage) async {
    await _flickrImageEntityDeletionAdapter.delete(flickrImage);
  }
}
