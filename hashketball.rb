require 'pry'

def game_hash
  game_hash = {
      home: {
          team_name: 'Brooklyn Nets',
          colors: %w(Black White),
          players: {
              'Alan Anderson' => {
                  number: 0,
                  shoe: 16,
                  points: 22,
                  rebounds: 12,
                  assists: 12,
                  steals: 3,
                  blocks: 1,
                  slam_dunks: 1
              },
              'Reggie Evans' => {
                  number: 30,
                  shoe: 14,
                  points: 12,
                  rebounds: 12,
                  assists: 12,
                  steals: 12,
                  blocks: 12,
                  slam_dunks: 7
              },
              'Brook Lopez' => {
                  number: 11,
                  shoe: 17,
                  points: 17,
                  rebounds: 19,
                  assists: 10,
                  steals: 3,
                  blocks: 1,
                  slam_dunks: 15
              },
              'Mason Plumlee' => {
                  number: 1,
                  shoe: 19,
                  points: 26,
                  rebounds: 12,
                  assists: 6,
                  steals: 3,
                  blocks: 8,
                  slam_dunks: 5
              },
              'Jason Terry' => {
                  number: 31,
                  shoe: 15,
                  points: 19,
                  rebounds: 2,
                  assists: 2,
                  steals: 4,
                  blocks: 11,
                  slam_dunks: 1
              }
          }
      },
      away: {
          team_name: 'Charlotte Hornets',
          colors: %w(Turquoise Purple),
          players: {
              'Jeff Adrien'=> {
                  number: 4,
                  shoe: 18,
                  points: 10,
                  rebounds: 1,
                  assists: 1,
                  steals: 2,
                  blocks: 7,
                  slam_dunks: 2
              },
              'Bismak Biyombo'=> {
                  number: 0,
                  shoe: 16,
                  points: 12,
                  rebounds: 4,
                  assists: 7,
                  steals: 7,
                  blocks: 15,
                  slam_dunks: 10
              },
              'DeSagna Diop'=> {
                  number: 2,
                  shoe: 14,
                  points: 24,
                  rebounds: 12,
                  assists: 12,
                  steals: 4,
                  blocks: 5,
                  slam_dunks: 5
              },
              'Ben Gordon'=> {
                  number: 8,
                  shoe: 15,
                  points: 33,
                  rebounds: 3,
                  assists: 2,
                  steals: 1,
                  blocks: 1,
                  slam_dunks: 0
              },
              'Brendan Haywood'=> {
                  number: 33,
                  shoe: 15,
                  points: 6,
                  rebounds: 12,
                  assists: 12,
                  steals: 22,
                  blocks: 5,
                  slam_dunks: 12
              }
          }
      }
  }

end


def good_practices
  game_hash.each do |location, team_info |
    # this runs 2 times - 1 for home and 1 for away
    # :home, hash with all other data
    # :away, hash with all other data
    # binding.pry
    team_info.each do | attribute, data |
      # this runs 6 times, 3 for home and 3 for away
      # :team_name, string
      # :colors, string array
      # :players, hash
      # binding.pry

      #data.each do | data_item |
        # 'NoMethodError for " Nets":String'
        # binding.pry

      team_info[:players].each do | player |
        puts player[0]  # => player name
        puts player[1]  # => player data hash
        puts player[1][:shoe]  # => player shoe size
        puts player[1].keys  # => all keys for player data hash
        player[1].each do | stat |
          puts stat  # => number 0
         binding.pry
        end
      end
    end
  end
end


# returns the number of points scored by each player
def num_points_scored(player)
  game_hash.each do |location, team_info |
    team_info[:players].select do | key, data |
       if key == player
         return data[:points]
       end
    end
  end
end
# puts value = num_points_scored("Brendan Haywood")


# returns the shoe size of each player
def shoe_size(player)
  game_hash.each do |location, team_info |
    team_info[:players].select do | key, data |
      if key == player
        return data[:shoe]
      end
    end
  end
end
# puts value = shoe_size("Brendan Haywood")



# knows the Brooklyn Nets colors are Black and White
def team_colors(team_name)
  game_hash.each do |location, team_info |
    if team_info[:team_name] == team_name
      return team_info[:colors]
    end
end
end
# puts value = team_colors('Charlotte Hornets')



# returns the team names
def team_names
  team_arr = []
  game_hash.each do |location, team_info |
      team_arr << team_info[:team_name]
  end
  team_arr
end
#puts value = team_names(game_hash)



# returns the player jersey numbers
def player_numbers(team_name)
  jersey_arr = []
  game_hash.each do |location, team_info |
    if team_info[:team_name] == team_name
      team_info[:players].each do | key, data |
        jersey_arr << data[:number]
      end
    end
  end
  jersey_arr
end
# puts value = player_numbers('Charlotte Hornets')



# returns all stats for a given player
def player_stats(player)
  game_hash.each do |location, team_info |
    team_info[:players].each do | key, data |
      if key == player
        return data
      end
    end
  end
end
# puts value = player_stats('Brendan Haywood')



# returns the number of rebounds of the player with the biggest shoe size
def big_shoe_rebounds
  size = 0
  rebounds = ''
  game_hash.each do |location, team_info |
    team_info[:players].each do | key, data |
      if data[:shoe] > size
        size = data[:shoe]
        rebounds = data[:rebounds]
      end

    end
  end
  return rebounds
end
# puts value = big_shoe_rebounds


# returns the player that scored the most points
def most_points_scored
  points = 0
  player = ''
  game_hash.each do |location, team_info |
    team_info[:players].each do | key, data |
      if data[:points] > points
        points = data[:points]
        player = key
      end
    end
  end
  return player
end
# puts value = most_points_scored













