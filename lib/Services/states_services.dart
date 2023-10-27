import 'dart:convert';

import 'package:flutter_practice_covid_tracker_app/Services/Utilities/app_urls.dart';
import 'package:http/http.dart' as http;

import '../Models/world_states_model.dart';

class StatesServices{

  Future<WorldStateModel> fetchWorldStatesRecoreds () async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body.toString());
      return WorldStateModel.fromJson(data);
    }
    else{
      throw Exception('Error in fetch WorldStatesRecords');
    }
  }
}