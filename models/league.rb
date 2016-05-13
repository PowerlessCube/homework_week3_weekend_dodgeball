require( 'pg' )
require_relative( './match.rb' )
require_relative( './team.rb' )

class League

  attr_reader( :id )
  attr_accessor( :matches )

  def initialize( options )
    @id = options[ 'id' ].to_i
    @matches = options[ 'matches' ].to_i
  end

  def save()
#saves changes
  end

  def self.all()
#lists all teams
  end

#Helper functions: repository for dry functions
  def self.delete_all
#deletes all information from trainers.
  end

  def self.map_items( sql )
#map multiple items to an array and returns the result through the team class.
  end

  def self.map_item( sql )
#uses the result = Trainer.map_items( sql ) and returns the first result
  end

end
