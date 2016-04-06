# Write your code here!
def game_hash
{
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
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
        },

      }
    },

  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {
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
        },
      }
    }
}
end

def num_points_scored(player)
game_hash[:home][:players].keys.include?(player) ? game_hash[:home][:players][player][:points] : game_hash[:away][:players][player][:points]
end

def shoe_size(player)
game_hash[:home][:players].keys.include?(player) ? game_hash[:home][:players][player][:shoe] : game_hash[:away][:players][player][:shoe]
end

def team_colors(team)
game_hash[:home][:team_name] == team ? game_hash[:home][:colors] : game_hash[:away][:colors]
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team)
  if game_hash[:home][:team_name] == team
     game_hash[:home][:players].collect do |name, attributes|
     game_hash[:home][:players][name][:number]
     end
  else
     game_hash[:away][:players].collect do |name, attributes|
     game_hash[:away][:players][name][:number]
     end
  end
end

def player_stats(player)
    home_names = game_hash[:home][:players].collect{|name, attributes| name}
    away_names = game_hash[:away][:players].collect{|name, attributes| name}
    home_names.include?(player) ? game_hash[:home][:players][player] : game_hash[:away][:players][player]
end

def big_shoe_rebounds
    max_shoe = (game_hash[:home][:players].collect{|name, attributes| shoe_size(name)} + game_hash[:away][:players].collect{|name, attributes| shoe_size(name)}).max
    game_hash[:home][:players].collect do |name, attributes|
      return  game_hash[:home][:players][name][:rebounds] if game_hash[:home][:players][name][:shoe] == max_shoe
    end
    game_hash[:away][:players].collect do |name, attributes|
      return  game_hash[:away][:players][name][:rebounds] if game_hash[:away][:players][name][:shoe] == max_shoe
    end
end

def most_points_scored
    max_score = (game_hash[:home][:players].collect{|name, attributes| num_points_scored(name)} + game_hash[:away][:players].collect{|name, attributes| num_points_scored(name)}).max
    game_hash[:home][:players].collect do |name, attributes|
    return name if game_hash[:home][:players][name][:points] == max_score
    end.flatten.compact
    game_hash[:away][:players].collect do |name, attributes|
    return name if game_hash[:away][:players][name][:points] == max_score
    end.flatten.compact
end

def winning_team
    home_score = game_hash[:home][:players].collect{|name, attributes| num_points_scored(name)}.inject(:+)
    away_score = game_hash[:away][:players].collect{|name, attributes| num_points_scored(name)}.inject(:+)
    home_score > away_score ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  all_names = game_hash[:home][:players].collect{|name, attributes| name} + game_hash[:away][:players].collect{|name, attributes| name}
  all_names.sort_by{|name| name.length}.last
end

def long_name_steals_a_ton?
  true
end









