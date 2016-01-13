# Write your code here!
require 'pry'

def game_hash
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          num_points_scored: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
          },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          num_points_scored: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
          },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          num_points_scored: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
          },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          num_points_scored: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
          },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          num_points_scored: 19,
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
      players:{
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          num_points_scored: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
          },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          num_points_scored: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
          },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          num_points_scored: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
          },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          num_points_scored: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
          },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          num_points_scored: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
          },
        },
      }
   }
end

def num_points_scored(player_name)
  points = ''
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, data_item|
          if name == player_name
            points = data_item[:num_points_scored]
          end
        end
      end
    end
  end
  points
end

def shoe_size(player_name)
  shoe_size= ''
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, data_item|
          if name == player_name
            shoe_size = data_item[:shoe]
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(team_name)
  colors = ''
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, data|
        if attribute == :colors
          colors = data
        end
      end
    end
  end
  colors
end

def team_names
  names = []
  game_hash.each do |location, team_data|
    names << team_data[:team_name]
  end
  names
end


def player_numbers(team_name)
  jersey_numbers= []
   game_hash.each do |location, team_data|
     if team_data[:team_name] == team_name
      team_data.each do |attribute, data|
        if attribute == :players
         data.each do |name, data_item|
         jersey_numbers << data_item[:number]
         end
        end
      end
     end
   end
  jersey_numbers
end

def player_stats(player_name)
  stats = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, data_item|
          if name == player_name
            data_item[:points]= data_item.delete :num_points_scored
            stats = data_item
          end
        end
      end
    end
  end
  stats
end

def big_shoe_rebounds
  max_shoe = 0
  max_player = ''
  max_rebound = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, data_item|
          if max_shoe<data_item[:shoe]
            max_shoe = data_item[:shoe]
            max_player = name
            max_rebound = data_item[:rebounds]
          end
        end
      end
    end
  end
  max_rebound
end








