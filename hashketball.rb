# Write your code here!
def game_hash
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
          },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
          },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
          },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
          },
        "Jason Terry" => {
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
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
          },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
          },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
          },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
          },
        "Brendan Haywood" => {
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

def num_points_scored(name)
  score = 0
  game_hash.each {|k, v|
    v[:players].each {|n, h|
      score = h[:points] if n == name
      }
    }
  score
end

def shoe_size(name)
  size = 0
  game_hash.each {|k , v|
    v[:players].each {|n, h|
      size = h[:shoe] if n == name
      }
    }
  size
end

def team_colors(team)
  array = Array.new
  game_hash.each {|k, v|
    array = v[:colors] if v[:team_name] == team
    }
  array
end

def team_names
  array = Array.new
  game_hash.each {|k, v|
    array.push(v[:team_name])
    }
  array
end

def player_numbers(team)
  array = Array.new
  game_hash.each {|k, v|
    if v[:team_name] == team
      v[:players].each {|n, h|
        array.push(h[:number])
        }
    end
    }
  array
end

def player_stats(name)
  hash = Hash.new
  game_hash.each {|k, v|
    v[:players].each {|n, h|
      hash = h if n == name
      }
    }
  hash
end

def big_shoe_rebounds
  rebounds = 0
  shoe = 0
  game_hash.each {|k, v|
    v[:players].each {|n, h|
      h[:shoe] > shoe ? shoe = h[:shoe] : shoe
      }
    }
  game_hash.each {|k, v|
    v[:players].each {|n, h|
      if h[:shoe] == shoe
        h[:rebounds] > rebounds ? rebounds = h[:rebounds] : rebounds
      end
      }
    }
  rebounds

end
