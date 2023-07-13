import 'dart:convert';

import 'package:wall_paper/services/provider/Api_helper.dart';
import 'package:wall_paper/model/image_model.dart';
import 'package:http/http.dart' as http;

class WallpaperRepository {

  Future<WalpaperModel> getWalpImage(String search) async{
    var url = "search?query=$search&per_page=10&orientation=portrait&size=small";
    String Api_key ="a4v2S3Ud57sR3fiFKyI3ACTphjvk4EOoANg1WZIbrcclS63d8l3Dq6od";
    var data = await ApiHelper().getApi(url,header: {
      'Authorization':Api_key
    });
      return WalpaperModel.fromJson(data);
  }

  Future<WalpaperModel> getWalp(String mQuery,) async {
    var url = "https://api.pexels.com/v1/search?query=Flower&per_page=10";
    String Api_key = "a4v2S3Ud57sR3fiFKyI3ACTphjvk4EOoANg1WZIbrcclS63d8l3Dq6od";
    var response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'a4v2S3Ud57sR3fiFKyI3ACTphjvk4EOoANg1WZIbrcclS63d8l3Dq6od'
    });
    if (response.statusCode == 200) {
      var jsond = json.decode(response.body);
      return WalpaperModel.fromJson(jsond);
    } else {
      return WalpaperModel();
    }
  }
  Future<WalpaperModel> getTrendingWalp() async{
    var url = "https://api.pexels.com/v1/search?query=flower&per_page=10";
    String Api_key ="a4v2S3Ud57sR3fiFKyI3ACTphjvk4EOoANg1WZIbrcclS63d8l3Dq6od";
    var response  = await http.get(Uri.parse(url),headers: {'Authorization':'a4v2S3Ud57sR3fiFKyI3ACTphjvk4EOoANg1WZIbrcclS63d8l3Dq6od'});
    if(response.statusCode == 200){
      var jsond = json.decode(response.body);
      return WalpaperModel.fromJson(jsond);
    }else{
      return WalpaperModel();
    }
  }
}