import 'package:islami_c20/core/resources/app_constants.dart';
import 'package:islami_c20/model/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  static late final SharedPreferences prefs ;
  static init()async{
    prefs = await SharedPreferences.getInstance();
  }

  static saveMostRecent(List<SuraModel> mostRecent){
    // [Fatiha , Al-Baqarah , ]
    prefs.setStringList("most_recent", mostRecent.map((sura)=>sura.suraNameEn,).toList());
  }

  static List<SuraModel> fatchMostRecent(){
    List<SuraModel> mostRecent = [];
    List<String> savedSuras = prefs.getStringList("most_recent")??[];
    for(int i=0;i<savedSuras.length;i++){

    SuraModel checkedSura =   AppConstants.surasList.firstWhere((element) =>element.suraNameEn== savedSuras[i],);
    mostRecent.add(checkedSura);
    }
    return mostRecent;
  }

}