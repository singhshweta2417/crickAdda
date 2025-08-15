import 'package:crickAdda/model/game_data_model.dart';
import 'package:crickAdda/model/game_type_model.dart';
import 'package:crickAdda/model/home_slider_model.dart';
import 'package:crickAdda/model/match_type_model.dart';
import 'package:flutter/foundation.dart';
import '../helper/network/network_api_services.dart';
import '../res/app_url_const.dart';

class GameApiService {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<HomeSliderBanner> getHomeBanner() async {
    try {
      final response = await _apiServices
          .getGetApiResponse(AppApiUrls.getHomeScreenBannerApiEndPoint);
      return HomeSliderBanner.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<GameTypeModel> getGameType() async {
    try {
      final response = await _apiServices
          .getGetApiResponse(AppApiUrls.getGameTypeApiEndPoint);
      return GameTypeModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<GamesDataModel> getGameData(String userToken, String gameId,String limit,String offset) async {
    try {
      if (kDebugMode) {
        print("Url data: ${AppApiUrls.getGameDataApiEndPoint}$userToken/$gameId/$limit/$offset");
      }
      final response = await _apiServices.getGetApiResponse("${AppApiUrls.getGameDataApiEndPoint}$userToken/$gameId/$limit/$offset");
      if (kDebugMode) {
        print(response);
        print("response limit offset");
      }

      return GamesDataModel.fromJson(response);
    } catch (e) {

      rethrow;

    }
  }

  Future<MatchTypeModel> getMatchType() async {
    try {
      final response = await _apiServices
          .getGetApiResponse(AppApiUrls.getMatchTypeApiEndPoint);
      return MatchTypeModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<GamesDataModel> get(String userToken, String gameId) async {
    try {
      final response = await _apiServices.getGetApiResponse(
          "${AppApiUrls.getGameDataApiEndPoint}$userToken/$gameId");
      return GamesDataModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
