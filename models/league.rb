require( 'pry-byebug' )


class League

attr_accessor(  )

  def initialize( matches )
    @matches = matches
  end

  def caluate_team_wins( id )
    win = 0
    for match in @matches
      if id == match.home_team_id
        if match.home_team_score > match.away_team_score
          win += 1
        end
      elsif id == match.away_team_id
        if match.away_team_score > match.home_team_score
          win += 1
        end
      end
    end
    return win
  end
  #
  # def league_standing( @matches )
  #
  #   for match in @matches
  #     match.map { | match | } calculate_team_wins( match.id )
  #   end
  #
  # end

end
