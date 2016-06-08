require 'pry'

def game_hash
 {
    :home =>{
      :team_name => ["Brooklyn Nets"] ,
      :colors => ["Black", "White"] ,
      :players =>{
          "Alan Anderson" =>{ :number => 0, :shoe =>16,:points =>22,:rebounds =>12,:assists =>12,:steals =>3,:blocks =>1,:slam_dunks =>1},
          "Reggie Evans"  =>{ :number => 30, :shoe =>14,:points =>12,:rebounds =>12,:assists =>12,:steals =>12,:blocks =>12,:slam_dunks =>7},
          "Brook Lopez"   =>{ :number => 11, :shoe =>17,:points =>17,:rebounds =>19,:assists =>10,:steals =>3,:blocks =>1,:slam_dunks =>15},
          "Mason Plumlee" =>{ :number => 1, :shoe =>19,:points =>26,:rebounds =>12,:assists =>6,:steals =>3,:blocks =>8,:slam_dunks =>5},
          "Jason Terry"   =>{ :number => 31, :shoe =>15,:points =>19,:rebounds =>2,:assists =>2,:steals =>4,:blocks =>11,:slam_dunks =>1},
           }
    },

  :away =>{
      :team_name => ["Charlotte Hornets"] ,
      :colors => ["Turquoise", "Purple"] ,
      :players =>{
          "Jeff Adrien"     =>{ :number => 4, :shoe =>18,:points =>10,:rebounds =>1,:assists =>1,:steals =>2,:blocks =>7,:slam_dunks =>2},
          "Bismak Biyombo"  =>{ :number => 0, :shoe =>16,:points =>12,:rebounds =>4,:assists =>7,:steals =>7,:blocks =>15,:slam_dunks =>10},
          "DeSagna Diop"    =>{ :number => 2, :shoe =>14,:points =>24,:rebounds =>12,:assists =>12,:steals =>4,:blocks =>5,:slam_dunks =>5},
          "Ben Gordon"      =>{ :number => 8, :shoe =>15,:points =>33,:rebounds =>3,:assists =>2,:steals =>1,:blocks =>1,:slam_dunks =>0},
          "Brendan Haywood" =>{ :number => 33,:shoe =>15,:points =>6,:rebounds =>12,:assists =>12,:steals =>22,:blocks =>5,:slam_dunks =>12},
           }
    }
 }

end

def all_players_stats
stats= (game_hash[:home][:players]).merge(game_hash[:away][:players])     
end


 game_hash[:home].merge(game_hash[:away]){|key, oldval, newval| [newval]+[oldval]}

def find_players_stats(name,stats)
  game_hash.each do |location, team_data|
    # location = :home 

    #   team data=  {
    #   :team_name => ["Brooklyn Nets"] ,
    #   :colors => ["Black", "White"] ,
    #   :players => {"Alan Anderson" =>{ :number => 0, :shoe =>16,:points =>22,:rebounds =>12,:assists =>12,:steals =>3,:blocks =>1,:slam_dunks =>1}
    # }
        team_data[:players].each do |player_name, attribute|
    #   player_name = "Alan Anderson"  attribute = { :number => 0, :shoe =>16,:points =>22,:rebounds =>12,:assists =>12,:steals =>3,:blocks =>1,:slam_dunks =>1}}
        return attribute[stats] if player_name==name 
      end
    end
end


def num_points_scored (player)
 find_players_stats(player,:points)
end

def shoe_size (player)
 find_players_stats(player,:shoe)
end

def team_colors (name)
  game_hash.each do |location, team_data|
     team_data.each do |attribute, data|
       return team_data[:colors] if data.first==name
    end
  end
end


def team_names
game_hash.each_with_object([]) do |(location, team_data), team_names_array|
     team_data.each do |attribute, data|
      if attribute== :team_name
        team_names_array << data
      end
    end
  end.flatten
end

team_names

def player_numbers (team)
game_hash.each do |location, team_data|
     if team_data[:team_name].first==team
      return team_data[:players].map {|name,stats| stats[:number]}
     end
  end
end




def player_stats(player)
game_hash.each do |location, team_data|
team_data[:players].each do |player_name, attribute|
        return attribute if player_name==player 
      end
    end
end



def big_shoe_rebounds
biggestShoeSize=0
playerStats=0

game_hash.each do |location, team_data|
     team_data.each do |attribute, data|
        data.each do |playersNames,stats|
          if stats.is_a? Hash
            if biggestShoeSize<stats[:shoe]
               biggestShoeSize=stats[:shoe]
               playerStats=stats[:rebounds]
            end
         end
        end
      end
    end
  
  playerStats
end

def most_points_scored
  #Find the player stats with the most points
  player = all_players_stats.values.max_by { |player| player[:points] }
  #Find out the name of the player that the top stats belong to.
  all_players_stats.key(player)
end





def winning_team
  #Find the total amount of points each team scored by combining all their players points
home_score=game_hash[:home][:players].inject(0){|mem,(players,stats)| mem +=stats[:points]}
away_score=game_hash[:away][:players].inject(0){|mem,(players,stats)| mem +=stats[:points]}
#compare both teams points and declare the winner
home_score>away_score ?  game_hash[:home][:team_name].first : game_hash[:away][:team_name].first
binding.pry
end



# def winning_team
# awayTeamPoints=[]
# homeTeamPoints=[]

# game_hash[:away].each do |attribute, data|
#         data.each do |playersNames,stats|
#              if stats.is_a? Hash
#               awayTeamPoints << stats[:points]
#              end
#         end
#       end

# game_hash[:home].each do |attribute, data|
#         data.each do |playersNames,stats|
#              if stats.is_a? Hash
#               homeTeamPoints << stats[:points]
#              end
#         end
#       end

#  if homeTeamPoints.inject(:+) > awayTeamPoints.inject(:+)
#     game_hash[:home][:team_name].first
#   elsif homeTeamPoints.inject(:+) < awayTeamPoints.inject(:+)
#      game_hash[:away][:team_name].first
#   end

# end

def player_with_longest_name
player={}
namelength=0
  game_hash.each do |location, team_data|
     team_data.each do |attribute, data|
        data.each do |playersNames,stats|
            if stats.is_a? Hash
            if namelength<playersNames.length
               namelength=playersNames.length
               player=playersNames
            end
         end
        end
     end
  end
player
end

def long_name_steals_a_ton?
player= ""
steals=0
  game_hash.each do |location, team_data|
     team_data.each do |attribute, data|
        data.each do |playersName,stats|
            if stats.is_a? Hash
            if steals<stats[:steals]
               steals=stats[:steals]
               player=playersName
            end
         end
        end
     end
  end
player==player_with_longest_name
end
