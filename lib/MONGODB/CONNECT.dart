
import 'package:mongo_dart/mongo_dart.dart';

class Mongodbdatabase{

static var db ,collectionName;
static connect()async{
  db =await Db.create(mongoUri);
await db.open();
  collectionName=db.collection();

}

}