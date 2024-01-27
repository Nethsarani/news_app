import 'package:sqflite/sqflite.dart' as sql;
import	'package:path/path.dart';
import	'package:news_app/models/User.dart';

class	DatabaseHandler	{

  static Future<void> createTables(sql.Database database) async {
    await database.execute("CREATE	TABLE	users(id	INTEGER	PRIMARY	KEY	AUTOINCREMENT,	name	TEXT	NOT	NULL,	username	TEXT	NOT	NULL,	password	TEXT NOT NULL)",);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("users.db", version: 1,
        onCreate: (sql.Database database, int version) async {
          await createTables(database);
        });
  }
  
  Future<int>	insertUser(User	users)	async	{
    int	result	=	0;
    final	db	=	await	DatabaseHandler.db();
    final id = await db.insert('users', users.toMap(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }
  
  Future<List<User>>	retrieveUsers()	async	{
    final	db	=	await	DatabaseHandler.db();
    final	List<Map<String,	Object?>>	queryResult	=	await	db.query('users');
    return	queryResult.map((e)	=>	User.fromMap(e)).toList();
  }
  
  Future<void>	deleteUser(int	id)	async	{
    final	db	=	await	DatabaseHandler.db();
    await	db.delete(
      'users',where:	"id	=	?",	whereArgs:	[id],
      );
  }
}		