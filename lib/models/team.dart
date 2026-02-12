class CricketTeam {
  final String name;
  final String countryCode; // Used for flags
  final int ranking;

  CricketTeam({required this.name, required this.countryCode, required this.ranking});
}

// Sample list of major cricket nations
List<CricketTeam> teams = [
  CricketTeam(name: 'Australia', countryCode: 'AU', ranking: 1),
  CricketTeam(name: 'India', countryCode: 'IN', ranking: 2),
  CricketTeam(name: 'England', countryCode: 'GB', ranking: 3),
  CricketTeam(name: 'South Africa', countryCode: 'ZA', ranking: 4),
  CricketTeam(name: 'New Zealand', countryCode: 'NZ', ranking: 5),
  CricketTeam(name: 'Pakistan', countryCode: 'PK', ranking: 6),
  CricketTeam(name: 'Sri Lanka', countryCode: 'LK', ranking: 7),
  CricketTeam(name: 'West Indies', countryCode: 'WI', ranking: 8),
  CricketTeam(name: 'Bangladesh', countryCode: 'BD', ranking: 9),
  CricketTeam(name: 'Afghanistan', countryCode: 'AF', ranking: 10),
];