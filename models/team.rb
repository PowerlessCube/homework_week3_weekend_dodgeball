require( 'pg' )
require_relative( '../db/sql_runner' )
require_relative( './match' )
require( 'pry-byebug' )

class Team

  attr_reader( :id )
  attr_accessor( :name )

  def initialize( options )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
  end

  def save(  )
    sql =
    "INSERT INTO teams (name)
    VALUES ( '#{ @name }' )
    RETURNING * ;"
    return Team.map_item( sql )
  end

  def update(  )
    sql =
    "UPDATE teams
    SET name = '#{@name}'
    WHERE id = '#{@id}'
    RETURNING * ;"
    return Team.map_item( sql )
  end

  def self.all(  )
    sql =
    "SELECT * FROM teams;"
    return Team.map_items( sql )
  end

#Helper functions: repository for dry functions
  def self.delete_all(  )
    sql = "DELETE FROM teams;"
    SqlRunner.run( sql )
  end

  def self.map_items( sql )
    teams = SqlRunner.run( sql )
    result = teams.map { | team | Team.new( team ) }
    return result

  end

  def self.map_item( sql )
    result = Team.map_items( sql )
    return result.first
  end

end
