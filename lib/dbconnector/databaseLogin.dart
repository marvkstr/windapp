import 'package:mysql1/mysql1.dart';
 

//Connection Klasse für Db anfrage und auslese von User etc


ConnectionSettings getSettings(){
    var settings = new ConnectionSettings(
      host: 'aldebaran.b-24.de', //extern
      //host: 'http://192.168.178.95', // intern
      port: 3306,
      user: 'windAdmin',
      password: 'jBpUJGliDIbv4tjZ',
      db: 'windpark');
  return settings;
}

getStatistikQuery(int windanlagenId) async {
  var conn = await MySqlConnection.connect(getSettings());
  var results = await conn.query('select * from statistik where windanlagenId = ?', [windanlagenId]);
  return results;
}

getProfilQuery(String profilId) async{
  var conn = await MySqlConnection.connect(getSettings());
  var results = await conn.query('select * from profil where profilId = ?', [profilId]);
  return results;
}
getOrderQuery(String profilId) async{
  var conn = await MySqlConnection.connect(getSettings());
  var results = await conn.query('select * from profil where profilId = ?', [profilId]);
  return results;
}

getWindTurbineQuery(String profilId) async{
  var conn = await MySqlConnection.connect(getSettings());
  var results = await conn.query('select * from windturbine where profilId = ?', [profilId]);
  return results;
}


 //TestMain
main(List<String> args) async {
  print("Start Db Connection");

  var results = await getStatistikQuery(1);
  
  for (var row in results) {
  print('WindanlagenId: ${row[0]}, ErsterTag: ${row[1]}');
  }

}