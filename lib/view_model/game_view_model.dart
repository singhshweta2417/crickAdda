import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../model/game_data_model.dart';
import '../model/game_type_model.dart';
import '../model/match_type_model.dart';
import '../repo/games_repo.dart';

enum GameState { loading, success, error, idle }

enum GameDataState { loading, success, noDataAvl, error }

class GameViewModel with ChangeNotifier {
  final GameApiService _gameApiService = GameApiService();
  GameTypeModel? _gameType;
  String _message = '';
  GameState _gameState = GameState.idle;
  GamesDataModel? _gameData;
  GameDataState _gameDataState = GameDataState.loading;
  MatchTypeModel? _matchType;
  int _selectedGameTabIndex = 0;
  int _selectedGameTypeId = 0;
  String? _userToken;
  String? get userToken=>_userToken;
  GameData? _selectedMatch;

  int _offset = 0;
  final int _limit = 10;
  bool _isFetchingMore = false;

  bool _hasMoreData = true;
  bool get hasMoreData => _hasMoreData;


  bool isLoading = false;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  GameTypeModel get gameType => _gameType!;
  GameState get gameState => _gameState;
  GamesDataModel get gameData => _gameData!;
  GameDataState get gameDataState => _gameDataState;
  MatchTypeModel get matchType => _matchType!;
  int get selectedGameTabIndex => _selectedGameTabIndex;
  int get selectedGameTypeId => _selectedGameTypeId;
  GameData get selectedMatch => _selectedMatch!;

  void updateToken(String token) {
    if (_userToken != token) {
      _userToken = token;
    }
  }

  _setGameState(GameState state) {
    _gameState = state;
    notifyListeners();
  }


  setSelectedGameTabIndex(int index, int typeId) {
    _selectedGameTabIndex = index;
    _selectedGameTypeId = typeId;
    notifyListeners();
  }

  setSelectedMatch(GameData match) {
    _selectedMatch = match;
    notifyListeners();
  }

  _setGameDataState(GameDataState state) {
    _gameDataState = state;
    notifyListeners();
  }

  Future<void> getGameType(context) async {
    _setGameState(GameState.loading);
    try {
      _gameType = await _gameApiService.getGameType();
      _message = _gameType!.msg.toString();
      _setGameState(GameState.success);
      getGameData(context, _gameType!.data![0].id.toString());
      _selectedGameTypeId = _gameType!.data![0].id!;
    } catch (e) {
      _message = 'Failed to load game type data: $e';
      _setGameState(GameState.error);
    }
    if (kDebugMode) {
      print(_message);
    }
    notifyListeners();
  }

  // Future<void> getGameData(context, String gameId,String limit,String offset) async {
  //   _setGameDataState(GameDataState.loading);
  //   try {
  //     _gameData = await _gameApiService.getGameData(_userToken.toString(), gameId,limit,offset);
  //     _message = _gameType!.msg.toString();
  //     if (_gameData!.complete!.isEmpty && _gameData!.upcoming!.isEmpty && _gameData!.live!.isEmpty) {
  //       _setGameDataState(GameDataState.noDataAvl);
  //     } else {
  //       _setGameDataState(GameDataState.success);
  //     }
  //   } catch (e) {
  //     _message = 'Failed to load match data: $e';
  //     _setGameDataState(GameDataState.error);
  //   }
  //   notifyListeners();
  // }

  Future<void> getGameData(BuildContext context, String gameId, {bool isLoadMore = false}) async {
    if (isLoadMore && (_isFetchingMore || !_hasMoreData)) return;
    _gameData ??= GamesDataModel(complete: [], upcoming: [], live: []);

    if (!isLoadMore) {
      _offset = 0;
      _hasMoreData = true;
      _setGameDataState(GameDataState.loading);
    } else {
      _isFetchingMore = true;
    }

    try {
      if (kDebugMode) {
        print("Fetching data with offset: $_offset and limit: $_limit");
      }

      GamesDataModel newData = await _gameApiService.getGameData(
        _userToken.toString(),
        gameId,
        _limit.toString(),
        _offset.toString(),
      );

      if (kDebugMode) {
        print("New data received: ${newData.upcoming?.length ?? 0} items");
      }

      // Ensure _gameData is not null before assigning values
      // _gameData ??= GamesDataModel(complete: [], upcoming: [], live: []);

      // Update message from _gameType
      _message = _gameType?.msg.toString() ?? "No data available";

      if ((newData.complete?.isEmpty ?? true) &&
          (newData.upcoming?.isEmpty ?? true) &&
          (newData.live?.isEmpty ?? true)) {
        // No data available, show message and set state
        _setGameDataState(GameDataState.noDataAvl);
      } else {
        // Data is available, so set success state
        _setGameDataState(GameDataState.success);
      }

      // Handle upcoming data separately
      if (newData.upcoming?.isNotEmpty ?? false) {
        if (!isLoadMore) {
          _gameData = newData;
        } else {
          _gameData?.upcoming?.addAll(newData.upcoming!);
        }
        _offset += _limit;
      } else {
        _hasMoreData = false;
      }

    } catch (e) {
      if (kDebugMode) {
        print("Error fetching data: $e");
      }
      _message = "Failed to load game data";
      _setGameDataState(GameDataState.error);
    }

    _isFetchingMore = false;
    notifyListeners();
  }

  void resetPagination() {
    _offset = 0;
    _hasMoreData = true;
  }


  Future<void> getMatchType(context) async {
    _setGameState(GameState.loading);
    try {
      _matchType = await _gameApiService.getMatchType();
      _message = _gameType!.msg.toString();
      _setGameState(GameState.success);
    } catch (e) {
      _message = 'Failed to load match type data: $e';
      _setGameState(GameState.error);
    }
    if (kDebugMode) {
      print(_message);
    }
    notifyListeners();
  }
}