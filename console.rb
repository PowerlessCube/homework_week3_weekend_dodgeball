require_relative( 'models/team.rb' )
require_relative( 'models/match.rb' )
require_relative( 'models/league.rb' )
require( 'pry-byebug' )

#team detele
Team.delete_all()
# Match.delete_all()

#teams newed up
team1 = Team.new( { 'name' => 'Average Joes' } )
team2 = Team.new( { 'name' => 'Purple Vipers' } )
team3 = Team.new( { 'name' => 'Edinburgh City Ballers' } )

#saves teams -
team1.save()
team2.save()
team3.save()

#Matches newed up
# match1 = Match.new( { 'away_team_score' => '' } )

#Matches saved


binding.pry
nil
