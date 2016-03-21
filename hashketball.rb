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

def num_points_scored (player)
points=0
  game_hash.each do |location, team_data|
     team_data.each do |attribute, data|
        data.map do |playersNames,stats|
             if playersNames==player
              points=stats[:points]
        end
      end
    end
  end
points
end

def shoe_size (player)
shoe=0
  game_hash.each do |location, team_data|
     team_data.each do |attribute, data|
        data.map do |playersNames,stats|
             if playersNames==player
              shoe=stats[:shoe]
        end
      end
    end
  end
shoe
end

def team_colors (name)
  game_hash.each do |location, team_data|
     team_data.each do |attribute, data|
       if data[0]==name
           return team_data.values[1]
       end
    end
  end
end

def team_names
teamNames=[]
  game_hash.each do |location, team_data|
     team_data.map do |attribute, data|
       if attribute== :team_name
       teamNames<< data
       end
    end
  end
  teamNames.flatten
end

def player_numbers (team)
playersNum=[]
 game_hash.each do |location, team_data|
     team_data.each do |attribute, data|
        if data[0]==team
        team_data.values[2].each do |player,stats|
                 playersNum<< stats[:number]
        end
      end
    end
  end
playersNum
end

def player_stats(player)
playerStats={}
  game_hash.each do |location, team_data|
     team_data.each do |attribute, data|
        data.each do |playersNames,stats|
          if playersNames==player
            playerStats= stats
        end
      end
    end
  end
  playerStats
end

def big_shoe_rebounds
biggestShoeSize=0
playerStats={}

game_hash.each do |location, team_data|
     team_data.each do |attribute, data|
        data.each do |playersNames,stats|
          if stats.is_a? Hash
            if biggestShoeSize<stats[:shoe]
               biggestShoeSize=stats[:shoe]
               playerStats=stats
            end
         end
        end
      end
    end
  biggestShoeSize
  playerStats[:rebounds]
end

def most_points_scored
player={}
points=0
  game_hash.each do |location, team_data|
     team_data.each do |attribute, data|
        data.each do |playersNames,stats|
            if stats.is_a? Hash
            if points<stats[:points]
               points=stats[:points]
               player=playersNames
            end
         end
        end
     end
  end
player
end


def winning_team
awayTeamPoints=[]
homeTeamPoints=[]
game_hash[:away].each do |attribute, data|
        data.each do |playersNames,stats|
             if stats.is_a? Hash
              awayTeamPoints << stats[:points]
             end
        end
      end
game_hash[:home].each do |attribute, data|
        data.each do |playersNames,stats|
             if stats.is_a? Hash
              homeTeamPoints << stats[:points]
             end
        end
      end
 if homeTeamPoints.inject(:+) > awayTeamPoints.inject(:+)
    game_hash[:home][:team_name][0]
  elsif homeTeamPoints.inject(:+) < awayTeamPoints.inject(:+)
     game_hash[:away][:team_name][0]
  end
end

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
        data.each do |playersNames,stats|
            if stats.is_a? Hash
            if steals<stats[:steals]
               steals=stats[:steals]
               player=playersNames
            end
         end
        end
     end
  end
player==player_with_longest_name
end
