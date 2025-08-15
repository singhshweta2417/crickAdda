class ContestDetailModel {
  dynamic matchName;
  dynamic prizePool;
  dynamic totalSpot;
  dynamic entryFee;
  dynamic firstPrize;

  List<Winning>? winning;
  List<Leaderboard>? leaderboard;
  dynamic msg;
  dynamic status;
  dynamic left_spot;
  dynamic entry_limit;
  dynamic contest_success_type;
  dynamic my_joined_count;
  dynamic entry;

  ContestDetailModel({
    this.matchName,
    this.prizePool,
    this.totalSpot,
    this.entryFee,
    this.firstPrize,
    this.winning,
    this.leaderboard,
    this.msg,
    this.status,
    this.left_spot,
    this.entry_limit,
    this.contest_success_type,
    this.my_joined_count,
    this.entry,
  });

  ContestDetailModel.fromJson(Map<String, dynamic> json) {
    matchName = json['matchName'];
    prizePool = json['prize_pool'];
    totalSpot = json['total_spot']??"0";
    entryFee = json['entry_fee'];
    firstPrize = json['first_prize'];

    if (json['winning'] != null) {
      winning = <Winning>[];
      json['winning'].forEach((v) {
        winning!.add(Winning.fromJson(v));
      });
    }

    if (json['leaderboard'] != null) { // Adjust this to create Leaderboard instances
      leaderboard = <Leaderboard>[];
      json['leaderboard'].forEach((v) {
        leaderboard!.add(Leaderboard.fromJson(v));
      });
    }

    msg = json['msg'];
    status = json['status'];
    left_spot = json['left_spot'];
    entry_limit = json['entry_limit'];
    contest_success_type = json['contest_success_type'];
    my_joined_count = json['my_joined_count'];
    entry = json['entry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matchName'] = matchName;
    data['prize_pool'] = prizePool;
    data['total_spot'] = totalSpot;
    data['entry_fee'] = entryFee;
    data['first_prize'] = firstPrize;


    if (winning != null) {
      data['winning'] = winning!.map((v) => v.toJson()).toList();
    }

    if (leaderboard != null) { // Update to properly serialize Leaderboard instances
      data['leaderboard'] = leaderboard!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    data['status'] = status;
    data['left_spot'] = left_spot;
    data['entry_limit'] = entry_limit;
    data['contest_success_type'] = contest_success_type;
    data['my_joined_count'] = my_joined_count;
    data['entry'] = entry;
    return data;
  }
}

class Winning {
  dynamic rank;
  dynamic prize;

  Winning({this.rank, this.prize});

  Winning.fromJson(Map<String, dynamic> json) {
    rank = json['rank'];
    prize = json['prize'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rank'] = rank;
    data['prize'] = prize;
    return data;
  }
}

class Leaderboard {
  dynamic id;
  dynamic gameid;
  dynamic matchId;
  dynamic userid;
  dynamic teamName;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic allPoint;
  dynamic ranks;
  dynamic username;
  dynamic userimage;
  dynamic winingZone;
  dynamic winnigNote;
  dynamic matchstatus;

  Leaderboard({
    this.id,
    this.gameid,
    this.matchId,
    this.userid,
    this.teamName,
    this.createdAt,
    this.updatedAt,
    this.allPoint,
    this.ranks,
    this.username,
    this.userimage,
    this.winingZone,
    this.winnigNote,
    this.matchstatus,
  });

  Leaderboard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gameid = json['gameid'];
    matchId = json['match_id'];
    userid = json['userid'];
    teamName = json['team_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    allPoint = json['all_point'];
    ranks = json['ranks'];
    username = json['username'];
    userimage = json['userimage'];
    winingZone = json['wining_zone'];
    winnigNote = json['winnig_note'];
    matchstatus = json['matchstatus'];
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
    data['ranks'] = ranks;
    data['username'] = username;
    data['userimage'] = userimage;
    data['wining_zone'] = winingZone;
    data['winnig_note'] = winnigNote;
    data['matchstatus'] = matchstatus;
    return data;
  }
}
