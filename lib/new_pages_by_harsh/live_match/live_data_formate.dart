String getBatsmanData(Map<String, dynamic> socketData, String field,String data) {
  try {
    final List<dynamic>? balls = socketData['balls'] as List<dynamic>?;
    if (balls != null && balls.isNotEmpty) {
      final Map<String, dynamic>? lastBall = balls.last as Map<String, dynamic>?;
      if (lastBall != null && lastBall.containsKey(data)) {
        final Map<String, dynamic>? batsmanData = lastBall[data];
        if (batsmanData != null && batsmanData.containsKey(field)) {
          return batsmanData[field] ?? "Unknown";
        } else {
          print("No $field found in batsman data");
        }
      } else {
        print("No batsman data in the last ball");
      }
    } else {
      print("Balls list is empty or not in the expected format");
    }
    return "";
  } catch (e) {
    print("Error accessing $field: $e");
    return "Error in data";
  }
}
