
def game_hash

  hashketball_game = {
                      home: {
                             team_name: "Brooklyn Nets",
                             colors: ["Black", "White"],
                             players: {
                                       "Alan Anderson" => {
                                                           :number => 0,
                                                           :shoe => 16,
                                                           :points => 22,
                                                           :rebounds => 12,
                                                           :assists => 12,
                                                           :steals => 3,
                                                           :blocks => 1,
                                                           :slam_dunks => 1
                                                          },
                                       "Reggie Evans" => {
                                                          :number => 30,
                                                          :shoe => 14,
                                                          :points => 12,
                                                          :rebounds => 12,
                                                          :assists => 12,
                                                          :steals => 12,
                                                          :blocks => 12,
                                                          :slam_dunks => 7
                                                         },
                                       "Brook Lopez" => {
                                                         :number => 11,
                                                         :shoe => 17,
                                                         :points => 17,
                                                         :rebounds => 19,
                                                         :assists => 10,
                                                         :steals => 3,
                                                         :blocks => 1,
                                                         :slam_dunks => 15
                                                        },
                                       "Mason Plumlee" => {
                                                           :number => 1,
                                                           :shoe => 19,
                                                           :points => 26,
                                                           :rebounds => 12,
                                                           :assists => 6,
                                                           :steals => 3,
                                                           :blocks => 8,
                                                           :slam_dunks => 5
                                                          },
                                       "Jason Terry" => {
                                                         :number => 31,
                                                         :shoe => 15,
                                                         :points => 19,
                                                         :rebounds => 2,
                                                         :assists => 2,
                                                         :steals => 4,
                                                         :blocks => 11,
                                                         :slam_dunks => 1
                                                        }
                                       }
                            },
                      away: {
                             team_name: "Charlotte Hornets",
                             colors: ["Turquoise", "Purple"],
                             players: {
                                       "Jeff Adrien" => {
                                                           :number => 4,
                                                           :shoe => 18,
                                                           :points => 10,
                                                           :rebounds => 1,
                                                           :assists => 1,
                                                           :steals => 2,
                                                           :blocks => 7,
                                                           :slam_dunks => 2
                                                          },
                                       "Bismak Biyombo" => {
                                                          :number => 0,
                                                          :shoe => 16,
                                                          :points => 12,
                                                          :rebounds => 4,
                                                          :assists => 7,
                                                          :steals => 7,
                                                          :blocks => 15,
                                                          :slam_dunks => 10
                                                         },
                                       "DeSagna Diop" => {
                                                         :number => 2,
                                                         :shoe => 14,
                                                         :points => 24,
                                                         :rebounds => 12,
                                                         :assists => 12,
                                                         :steals => 4,
                                                         :blocks => 5,
                                                         :slam_dunks => 5
                                                        },
                                       "Ben Gordon" => {
                                                           :number => 8,
                                                           :shoe => 15,
                                                           :points => 33,
                                                           :rebounds => 3,
                                                           :assists => 2,
                                                           :steals => 1,
                                                           :blocks => 1,
                                                           :slam_dunks => 0
                                                          },
                                       "Brendan Haywood" => {
                                                         :number => 33,
                                                         :shoe => 15,
                                                         :points => 6,
                                                         :rebounds => 12,
                                                         :assists => 12,
                                                         :steals => 22,
                                                         :blocks => 5,
                                                         :slam_dunks => 12
                                                        }
                                       }
                            }
                     }
end

def get_player_stats(name, stat)

  game_hash.each do |key, value|
    value.each do |key2, value2|
      if key2 == :players
        value2.each do |player_name, stats_hash|
          if player_name == name
            if stat == "all"
              return stats_hash
            else
              return stats_hash[stat]
            end
          end
        end
      end
    end
  end

  return "Did not find player."

end

def num_points_scored(name)
  get_player_stats(name, :points)
end

def shoe_size(name)
  get_player_stats(name, :shoe)
end

def get_team_stats(team, fact)

  game_hash.each do |key, value|
    return value[fact] if value[:team_name] == team
  end

  return "Did not find team."
end

def team_colors(team)
  get_team_stats(team, :colors)
end

def team_names

  team_array = []

  game_hash.each do |key, value|
    team_array << value[:team_name]
  end

  team_array

end

def player_numbers(team)

  numbers = []

  game_hash.each do |key, value|
    if value[:team_name] == team
      value[:players].each_value do |stats|
        numbers << stats[:number]
      end
    end
  end

  numbers

end

def player_stats(name)
  get_player_stats(name, "all")
end

def big_shoe_rebounds

  current_largest_shoe = 0
  current_largest_rebounds = 0

  game_hash.each do |key, value|
    value.each do |key2, value2|
      if key2 == :players
        value2.each do |player_name, stats_hash|
          if stats_hash[:shoe] > current_largest_shoe
            current_largest_shoe = stats_hash[:shoe]
            current_largest_rebounds = stats_hash[:rebounds]
          end
        end
      end
    end
  end

 current_largest_rebounds

end
