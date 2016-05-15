require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( './team' )

class Match

  attr_reader( :id )
  attr_accessor( :away_team_score, :home_team_score, :away_team_id, :home_team_id, :home_team_name, :away_team_name)

  def initialize( options )
    @id = options[ 'id' ].to_i
    @away_team_score = options[ 'away_team_score' ].to_i
    @home_team_score = options[ 'home_team_score' ].to_i
    @away_team_id = options[ 'away_team_id' ].to_i
    @home_team_id = options[ 'home_team_id' ].to_i
    @away_team_name = options[ 'away_team_name' ].to_s
    @home_team_name = options[ 'home_team_name' ].to_s
  end

  def save()
    sql =
    "INSERT INTO matches (
      away_team_score,
      home_team_score,
      away_team_id,
      home_team_id )
    VALUES (
      #{@away_team_score},
      #{@home_team_score},
      #{@away_team_id},
      #{@home_team_id})
    RETURNING *;"
    return Match.map_item( sql )
  end

  def update(  )
    sql =
    "UPDATE matches
    SET
      away_team_score = #{@away_team_score},
      home_team_score = #{@home_team_score},
      away_team_id = #{@away_team_id},
      home_team_id = #{@home_team_id}
    WHERE id = #{@id}
    RETURNING * ;"
    return Match.map_item( sql )
  end

  def self.get_matches_by_team( id )
    sql =
    "SELECT
      m.id AS id,
      ht.id AS home_team_id,
      ht.name AS home_team_name,
      m.home_team_score AS home_team_score,
      m.away_team_score AS away_team_score,
      at.name AS away_team_name,
      at.id AS away_team_id
    FROM matches m
    INNER JOIN teams at
    ON m.away_team_id = at.id
    INNER JOIN teams ht
    ON m.home_team_id = ht.id
    WHERE at.id = #{id}
    OR ht.id = #{id};"
    return Match.map_items( sql )
  end

  def self.all()
    sql =
    "SELECT
      m.id AS id,
      ht.id AS home_team_id,
      ht.name AS home_team_name,
      m.home_team_score AS home_team_score,
      m.away_team_score AS away_team_score,
      at.name AS away_team_name,
      at.id AS away_team_id
    FROM matches m
    INNER JOIN teams at
    ON m.away_team_id = at.id
    INNER JOIN teams ht
    ON m.home_team_id = ht.id;"
    return Match.map_items( sql )
  end

#Helper functions: repository for dry functions
  def self.delete_all
    sql = "DELETE FROM matches;"
    SqlRunner.run( sql )
  end

  def self.map_items( sql )
    matches = SqlRunner.run( sql )
    result = matches.map { | match | Match.new( match ) }
    return result
  end

  def self.map_item( sql )
    result = Match.map_items( sql )
    return result.first
  end

end
