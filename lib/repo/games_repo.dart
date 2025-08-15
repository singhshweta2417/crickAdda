import 'package:crickAdda/model/game_data_model.dart';
import 'package:crickAdda/model/game_type_model.dart';
import 'package:crickAdda/model/home_slider_model.dart';
import 'package:crickAdda/model/match_type_model.dart';
import '../helper/network/network_api_services.dart';
import '../res/app_url_const.dart';

class GameApiService{
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<HomeSliderBanner> getHomeBanner() async {
    try {
      final response = await _apiServices.getGetApiResponse(AppApiUrls.getHomeScreenBannerApiEndPoint);
      return HomeSliderBanner.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<GameTypeModel> getGameType() async {
    try {
      final response = await _apiServices.getGetApiResponse(AppApiUrls.getGameTypeApiEndPoint);
      return GameTypeModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<GamesDataModel> getGameData(String userToken, String gameId) async {
    print('hgfd');
    try {
      print('wsxdefcg');
      final response = await _apiServices.getGetApiResponse("${AppApiUrls.getGameDataApiEndPoint}$userToken/$gameId");
      print("${AppApiUrls.getGameDataApiEndPoint}$userToken/$gameId");
      print('huuu');
      return GamesDataModel.fromJson(response);

    } catch (e) {

      rethrow;

    }
  }

  Future<MatchTypeModel> getMatchType() async {
    try {
      final response = await _apiServices.getGetApiResponse(AppApiUrls.getMatchTypeApiEndPoint);
      return MatchTypeModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<GamesDataModel> get(String userToken, String gameId) async {
    try {
      final response = await _apiServices.getGetApiResponse("${AppApiUrls.getGameDataApiEndPoint}$userToken/$gameId");
      return GamesDataModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

}