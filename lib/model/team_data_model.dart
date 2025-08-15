class TeamDataModel {
  List<TeamData>? data;
  dynamic msg;
  dynamic status;

  TeamDataModel({this.data, this.msg, this.status});

  TeamDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TeamData>[];
      json['data'].forEach((v) {
        data!.add(TeamData.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    data['status'] = status;
    return data;
  }
}

class TeamData {
  dynamic id;
  dynamic gameid;
  dynamic matchId;
  dynamic userid;
  dynamic teamName;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic allPoint;
  dynamic captainName;
  dynamic captainImage;
  dynamic viceCaptainName;
  dynamic viceCaptainImage;
  dynamic aR;
  dynamic bAT;
  dynamic bOWL;
  dynamic wK;
  dynamic homeTeamid;
  dynamic visitorteamId;
  dynamic hometeamName;
  dynamic visitorteamName;
  dynamic homeTeamPlayerCount;
  dynamic visitorTeamPlayerCount;
  dynamic matchstatus;
  List<TeamPlayerList>? playerlist;
  dynamic joinedStatus;


  TeamData(
      {this.id,
      this.gameid,
      this.matchId,
      this.userid,
      this.teamName,
      this.createdAt,
      this.updatedAt,
      this.allPoint,
      this.captainName,
      this.captainImage,
      this.viceCaptainName,
      this.viceCaptainImage,
      this.aR,
      this.bAT,
      this.bOWL,
      this.wK,
      this.homeTeamid,
      this.visitorteamId,
      this.hometeamName,
      this.visitorteamName,
      this.homeTeamPlayerCount,
      this.visitorTeamPlayerCount,
      this.matchstatus,
      this.playerlist,
      this.joinedStatus
      });

  TeamData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gameid = json['gameid'];
    matchId = json['match_id'];
    userid = json['userid'];
    teamName = json['team_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    allPoint = json['all_point'];
    captainName = json['captain_name'];
    captainImage = json['captain_image'];
    viceCaptainName = json['vice_captain_name'];
    viceCaptainImage = json['vice_captain_image'];
    aR = json['AR'];
    bAT = json['BAT'];
    bOWL = json['BOWL'];
    wK = json['WK'];
    homeTeamid = json['home_teamid'];
    visitorteamId = json['visitorteam_id'];
    hometeamName = json['hometeam_name'];
    visitorteamName = json['visitorteam_name'];
    homeTeamPlayerCount = json['home_team_player_count'];
    visitorTeamPlayerCount = json['visitor_team_player_count'];
    matchstatus = json['matchstatus'];
    if (json['playerlist'] != null) {
      playerlist = <TeamPlayerList>[];
      json['playerlist'].forEach((v) {
        playerlist!.add(TeamPlayerList.fromJson(v));
      });
    }
    joinedStatus = json["joined_status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gameid'] = gameid;
    data['match_id'] = matchId;
    data['userid'] = userid;
    data['team_name'] = teamName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['all_point'] = allPoint;
    data['captain_name'] = captainName;
    data['captain_image'] = captainImage;
    data['vice_captain_name'] = viceCaptainName;
    data['vice_captain_image'] = viceCaptainImage;
    data['AR'] = aR;
    data['BAT'] = bAT;
    data['BOWL'] = bOWL;
    data['WK'] = wK;
    data['home_teamid'] = homeTeamid;
    data['visitorteam_id'] = visitorteamId;
    data['hometeam_name'] = hometeamName;
    data['visitorteam_name'] = visitorteamName;
    data['home_team_player_count'] = homeTeamPlayerCount;
    data['visitor_team_player_count'] = visitorTeamPlayerCount;
    if (playerlist != null) {
      data['playerlist'] = playerlist!.map((v) => v.toJson()).toList();
    }
    data["joined_status"]= joinedStatus;
    return data;
  }
}

class TeamPlayerList {
  dynamic id;
  dynamic matchid;
  dynamic myTeamid;
  dynamic playerid;
  dynamic sportsmonkPid;
  dynamic designationName;
  dynamic isCaptain;
  dynamic isViceCaptain;
  dynamic teamid;
  dynamic totalPoint;
  dynamic battingPoint;
  dynamic bollingPoint;
  dynamic fieldingPoint;
  dynamic playingPoint;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic playerName;
  dynamic playerImage;
  dynamic teamname;
  dynamic sel_by;
  dynamic c_by;
  dynamic vc_by;

  TeamPlayerList({
    this.id,
    this.matchid,
    this.myTeamid,
    this.playerid,
    this.sportsmonkPid,
    this.designationName,
    this.isCaptain,
    this.isViceCaptain,
    this.teamid,
    this.totalPoint,
    this.battingPoint,
    this.bollingPoint,
    this.fieldingPoint,
    this.playingPoint,
    this.createdAt,
    this.updatedAt,
    this.playerName,
    this.playerImage,
    this.teamname,
    this.sel_by,
    this.c_by,
    this.vc_by,
  });

  TeamPlayerList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matchid = json['matchid'];
    myTeamid = json['my_teamid'];
    playerid = json['playerid'];
    sportsmonkPid = json['sportsmonk_pid'];
    designationName = json['designation_name'];
    isCaptain = json['is_captain'];
    isViceCaptain = json['is_vice_captain'];
    teamid = json['teamid'];
    totalPoint = json['total_point'];
    battingPoint = json['batting_point'];
    bollingPoint = json['bolling_point'];
    fieldingPoint = json['fielding_point'];
    playingPoint = json['playing_point'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    playerName = json['player_name'];
    playerImage = json['player_image'];
    teamname = json['teamname'];
    sel_by = json['sel_by'];
    c_by = json['c_by'];
    vc_by = json['vc_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['matchid'] = matchid;
    data['my_teamid'] = myTeamid;
    data['playerid'] = playerid;
    data['sportsmonk_pid'] = sportsmonkPid;
    data['designation_name'] = designationName;
    data['is_captain'] = isCaptain;
    data['is_vice_captain'] = isViceCaptain;
    data['teamid'] = teamid;
    data['total_point'] = totalPoint;
    data['batting_point'] = battingPoint;
    data['bolling_point'] = bollingPoint;
    data['fielding_point'] = fieldingPoint;
    data['playing_point'] = playingPoint;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['player_name'] = playerName;
    data['player_image'] = playerImage;
    data['teamname'] = teamname;
    data['sel_by'] = sel_by;
    data['c_by'] = c_by;
    data['vc_by'] = vc_by;
    return data;
  }
}
