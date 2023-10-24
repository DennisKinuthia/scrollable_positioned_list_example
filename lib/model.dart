class MatchViewModel {
  MatchViewModel({
     required this.matchDateTime,
    required this.homeTeamName,
    required this.awayTeamName,
    
  });
  final DateTime matchDateTime;
  final String homeTeamName;
  final String awayTeamName;
  

  @override
  String toString() {
    return 'MatchViewModel(matchDateTime: $matchDateTime, homeTeamName: $homeTeamName, awayTeamName: $awayTeamName)';
  }
}
