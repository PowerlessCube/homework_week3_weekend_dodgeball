require_relative( 'models/team.rb' )
require_relative( 'models/match.rb' )
require_relative( 'models/league.rb' )
require( 'pry-byebug' )

Match.delete_all(  )
Team.delete_all(  )


team1 = Team.new( { 'name' => 'Average Joes' } )
team2 = Team.new( { 'name' => 'Purple Vipers' } )
team3 = Team.new( { 'name' => 'Edinburgh City Ballers' } )

t1 = team1.save(  )
t2 = team2.save(  )
t3 = team3.save(  )

match1 = Match.new( { 'away_team_score' => 0, 'home_team_score' => 3, 'away_team_id' => t1.id, 'home_team_id' => t2.id } )
match2 = Match.new( { 'away_team_score' => 0, 'home_team_score' => 3, 'away_team_id' => t3.id, 'home_team_id' => t2.id } )
match3 = Match.new( { 'away_team_score' => 3, 'home_team_score' => 0, 'away_team_id' => t1.id, 'home_team_id' => t3.id } )

m1 = match1.save(  )
m2 = match2.save(  )
m3 = match3.save(  )


binding.pry
nil
