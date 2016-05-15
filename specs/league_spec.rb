require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../models/league' )
require_relative( '../models/match' )
require_relative( '../models/team' )

class LeagueTest < Minitest::Test

  def setup

    team1 = Team.new( { 'id' => 1, 'name' => 'Average Joes' } )
    team2 = Team.new( { 'id' => 2, 'name' => 'Purple Vipers' } )
    team3 = Team.new( { 'id' => 3, 'name' => 'Edinburgh City Ballers' } )

    @teams = [ team1, team2, team3 ]

    match1 = Match.new( { 'away_team_score' => 0, 'home_team_score' => 3, 'away_team_id' => team1.id, 'away_team_name' => team1.name,  'home_team_id' => team2.id, 'home_team_name' => team2.name } )
    match2 = Match.new( { 'away_team_score' => 3, 'home_team_score' => 0, 'away_team_id' => team2.id, 'away_team_name' => team2.name,  'home_team_id' => team3.id, 'home_team_name' => team3.name } )
    match3 = Match.new( { 'away_team_score' => 0, 'home_team_score' => 3, 'away_team_id' => team1.id, 'away_team_name' => team1.name,  'home_team_id' => team3.id, 'home_team_name' => team3.name } )

    @matches = [ match1, match2, match3 ]

    @league = League.new( @matches )
  end

  def test_calculate_team_wins( )
    assert_equal( 0, @league.caluate_team_wins( 1 ) )
    assert_equal( 2, @league.caluate_team_wins( 2 ) )
    assert_equal( 1, @league.caluate_team_wins( 3 ) )
  end

  # def test_calculate_team_points(  )
  #
  # end




end
