import 'package:final_project_e_commerce/model/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProductHelper {
  // nome da tabela e das colunas
  final String productTable = 'productTable';
  final String idColumn = 'id_column';
  final String imageColumn = 'image_column';
  final String titleColumn = 'title_column';
  final String descriptionColumn = 'description_column';
  final String priceColumn = 'price_column';
  final String sizeColumn = 'size_column';
  final String colorColumn = 'color_column';

  static final ProductHelper _instance = ProductHelper.internal();
  
  factory ProductHelper() => _instance;
  
  ProductHelper.internal();
  
  Database _db;
  
  initDb() async {
    final dataBasePath = await getDatabasesPath();
    final path = join(dataBasePath, 'products.db');
    
    return openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async{
          await db.execute(
            "CREATE TABLE $productTable("
                "$idColumn INTEGER PRIMARY KEY, "
                "$imageColumn TEXT, "
                "$titleColumn TEXT, "
                "$descriptionColumn TEXT, "
                "$priceColumn TEXT, "
                "$sizeColumn TEXT, "
                "$colorColumn TEXT)"
          );
    });
    
  }
  
  Future<Database> get db async {
    if(_db != null)
      return _db;
    
    _db = await initDb();
    return _db;
  }

  Future close() async {
    Database dbProduct = await db;
    dbProduct.close();
  }

  Future<Product> saveProduct(Product product) async {
    Database dbProduct = await db;
    product.id = await dbProduct.insert(productTable, product.toMap());
  }

  Future<List<Product>> fetchAllProducts() async {
    Database dbProduct = await db;
    List listMap = await dbProduct.query(
        productTable, columns: [
      idColumn,
      imageColumn,
      titleColumn,
      descriptionColumn,
      priceColumn,
      sizeColumn,
      colorColumn]);

    List<Product> listProduct = [];

    for(Map map in listMap) {
      listProduct.add(Product.fromMap(map));
    }

    if(listProduct.isNotEmpty)
      return listProduct;
    else
      return null;
  }

  Future<Product> findById(int id) async {
    Database dbProduct = await db;
    List<Map> maps = await dbProduct.query(
        productTable, columns: [
          idColumn,
          imageColumn,
          titleColumn,
          descriptionColumn,
          priceColumn,
          sizeColumn,
          colorColumn],
      where: '$idColumn = ?',
      whereArgs: [id]);

    if(maps.length > 0)
      return Product.fromMap(maps.first);
    else
      return null;
  }

  Future<int> delete(int id) async {
    Database dbProduct = await db;
    return  await dbProduct.delete(
        productTable,
        where: '$idColumn = ?',
        whereArgs: [id]);
  }

  Future<int> update(Product product) async {
    Database dbProduct = await db;
    return  await dbProduct.update(
        productTable,
        product.toMap(),
        where: '$idColumn = ?',
        whereArgs: [product.id]);
  }

  Future<int> getSize() async {
    Database dbProduct = await db;
    return Sqflite.firstIntValue(await dbProduct.rawQuery(
        'SELECT COUNT(*) FROM $productTable'
    ));
  }

}