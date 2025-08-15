
class MatchPlayer {
  dynamic id;
  dynamic matchid;
  dynamic playerid;
  dynamic sportsmonkPid;
  dynamic teamid;
  dynamic isPlaying;
  dynamic thirdPartySeasonId;
  dynamic totalPoint;
  dynamic bollingPoint;
  dynamic fieldingPoint;
  dynamic playingPoint;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic playername;
  dynamic playerimage;
  dynamic teamname;
  dynamic designationName;
  dynamic selBy;
  dynamic cBy;
  dynamic vcBy;

  MatchPlayer(
      {this.id,
        this.matchid,
        this.playerid,
        this.sportsmonkPid,
        this.teamid,
        this.isPlaying,
        this.thirdPartySeasonId,
        this.totalPoint,
        this.bollingPoint,
        this.fieldingPoint,
        this.playingPoint,
        this.createdAt,
        this.updatedAt,
        this.playername,
        this.playerimage,
        this.teamname,
        this.designationName,
        this.selBy,
        this.cBy,
        this.vcBy});

  MatchPlayer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matchid = json['matchid'];
    playerid = json['playerid'];
    sportsmonkPid = json['sportsmonk_pid'];
    teamid = json['teamid'];
    isPlaying = json['is_playing'];
    thirdPartySeasonId = json['third_party_season_id'];
    totalPoint = json['total_point'];
    bollingPoint = json['bolling_point'];
    fieldingPoint = json['fielding_point'];
    playingPoint = json['playing_point'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    playername = json['playername'];
    playerimage = json['playerimage'];
    teamname = json['teamname'];
    designationName = json['designation_name'];
    selBy = json['sel_by'];
    cBy = json['c_by'];
    vcBy = json['vc_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['matchid'] = this.matchid;
    data['playerid'] = this.playerid;
    data['sportsmonk_pid'] = this.sportsmonkPid;
    data['teamid'] = this.teamid;
    data['is_playing'] = this.isPlaying;
    data['third_party_season_id'] = this.thirdPartySeasonId;
    data['total_point'] = this.totalPoint;
    data['bolling_point'] = this.bollingPoint;
    data['fielding_point'] = this.fieldingPoint;
    data['playing_point'] = this.playingPoint;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['playername'] = this.playername;
    data['playerimage'] = this.playerimage;
    data['teamname'] = this.teamname;
    data['designation_name'] = this.designationName;
    data['sel_by'] = this.selBy;
    data['c_by'] = this.cBy;
    data['vc_by'] = this.vcBy;
    return data;
  }
}

class TeamsData {
  dynamic id;
  dynamic gameid;
  dynamic matchId;
  dynamic userid;
  dynamic teamName;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic allPoint;
  dynamic visitorteam_id;
  dynamic hometeam_id;
  List<Playerlist>? playerlist;

  TeamsData(
      {this.id,
        this.gameid,
        this.matchId,
        this.userid,
        this.teamName,
        this.createdAt,
        this.updatedAt,
        this.allPoint,
         this.visitorteam_id,
         this.hometeam_id,
        this.playerlist});

  TeamsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gameid = json['gameid'];
    matchId = json['match_id'];
    userid = json['userid'];
    teamName = json['team_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    allPoint = json['all_point'];
    visitorteam_id = json['visitorteam_id'];
    hometeam_id = json['hometeam_id'];
    if (json['playerlist'] != null) {
      playerlist = <Playerlist>[];
      json['playerlist'].forEach((v) {
        playerlist!.add(new Playerlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['gameid'] = this.gameid;
    data['match_id'] = this.matchId;
    data['userid'] = this.userid;
    data['team_name'] = this.teamName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['all_point'] = this.allPoint;
    if (this.playerlist != null) {
      data['playerlist'] = this.playerlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Playerlist {
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
  dynamic selBy;
  dynamic cBy;
  dynamic vcBy;

  Playerlist(
      {this.id,
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
        this.selBy,
        this.cBy,
        this.vcBy});

  Playerlist.fromJson(Map<String, dynamic> json) {
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
    selBy = json['sel_by'];
    cBy = json['c_by'];
    vcBy = json['vc_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['matchid'] = this.matchid;
    data['my_teamid'] = this.myTeamid;
    data['playerid'] = this.playerid;
    data['sportsmonk_pid'] = this.sportsmonkPid;
    data['designation_name'] = this.designationName;
    data['is_captain'] = this.isCaptain;
    data['is_vice_captain'] = this.isViceCaptain;
    data['teamid'] = this.teamid;
    data['total_point'] = this.totalPoint;
    data['batting_point'] = this.battingPoint;
    data['bolling_point'] = this.bollingPoint;
    data['fielding_point'] = this.fieldingPoint;
    data['playing_point'] = this.playingPoint;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['player_name'] = this.playerName;
    data['player_image'] = this.playerImage;
    data['teamname'] = this.teamname;
    data['sel_by'] = this.selBy;
    data['c_by'] = this.cBy;
    data['vc_by'] = this.vcBy;
    return data;
  }
}


