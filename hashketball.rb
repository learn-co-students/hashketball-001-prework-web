#require 'pry'

def game_hash
	{
		:home =>  {
			:team_name =>  "Brooklyn Nets",
			:colors =>  ["Black","White"],
			:players =>  {
				:"Alan Anderson" =>  {
					:player_name =>  "Alan Anderson",
					:number =>  "0",
					:shoe =>  "16",
					:points =>  "22",
					:rebounds =>  "12",
					:assists =>  "12",
					:steals =>  "3",
					:blocks =>  "1",
					:slam_dunks =>  "1",
				},
				:"Reggie Evans" =>  {
					:player_name =>  "Reggie Evans",
					:number =>  "30",
					:shoe =>  "14",
					:points =>  "12",
					:rebounds =>  "12",
					:assists =>  "12",
					:steals =>  "12",
					:blocks =>  "12",
					:slam_dunks =>  "7",
				},
				:"Brook Lopez" =>  {
					:player_name =>  "Brook Lopez",
					:number =>  "11",
					:shoe =>  "17",
					:points =>  "17",
					:rebounds =>  "19",
					:assists =>  "10",
					:steals =>  "3",
					:blocks =>  "1",
					:slam_dunks =>  "15",
				},
				:"Mason Plumlee" =>  {
					:player_name =>  "Mason Plumlee",
					:number =>  "1",
					:shoe =>  "19",
					:points =>  "26",
					:rebounds =>  "12",
					:assists =>  "6",
					:steals =>  "3",
					:blocks =>  "8",
					:slam_dunks =>  "5",
				},
				:"Jason Terry" =>  {
					:player_name =>  "Jason Terry",
					:number =>  "31",
					:shoe =>  "15",
					:points =>  "19",
					:rebounds =>  "2",
					:assists =>  "2",
					:steals =>  "4",
					:blocks =>  "11",
					:slam_dunks =>  "1",
				},
			}
		},
		:away => {
			:team_name =>  "Charlotte Hornets",
			:colors =>  ["Turquoise","Purple"],
			:players =>  {
				:"Jeff Adrien" =>  {
					:player_name =>  "Jeff Adrien",
					:number =>  "4",
					:shoe =>  "18",
					:points =>  "10",
					:rebounds =>  "1",
					:assists =>  "1",
					:steals =>  "2",
					:blocks =>  "7",
					:slam_dunks =>  "2",
				},
				:"Bismak Biyombo" =>  {
					:player_name =>  "Bismak Biyombo",
					:number =>  "0",
					:shoe =>  "16",
					:points =>  "12",
					:rebounds =>  "4",
					:assists =>  "7",
					:steals =>  "7",
					:blocks =>  "15",
					:slam_dunks =>  "10",
				},
				:"DeSagna Diop" =>  {
					:player_name =>  "DeSagna Diop",
					:number =>  "2",
					:shoe =>  "14",
					:points =>  "24",
					:rebounds =>  "12",
					:assists =>  "12",
					:steals =>  "4",
					:blocks =>  "5",
					:slam_dunks =>  "5",
				},
				:"Ben Gordon" =>  {
					:player_name =>  "Ben Gordon",
					:number =>  "8",
					:shoe =>  "15",
					:points =>  "33",
					:rebounds =>  "3",
					:assists =>  "2",
					:steals =>  "1",
					:blocks =>  "1",
					:slam_dunks =>  "0",
				},
				:"Brendan Haywood" =>  {
					:player_name =>  "Brendan Haywood",
					:number =>  "33",
					:shoe =>  "15",
					:points =>  "6",
					:rebounds =>  "12",
					:assists =>  "12",
					:steals =>  "22",
					:blocks =>  "5",
					:slam_dunks =>  "12",
				},
			}
		}
	}
end

def num_points_scored(name)
	s = ""
	game_hash.each do |location, team_data|
		team_data.each do |attribute, value|
			if attribute == :players
				value.each do |player, stats|
					if player.to_s == name
						stats.each do |stat, val|
							if stat == :points
								s = val
							end
						end
					end
				end
			end
		end
	end
	s.to_i
end

def shoe_size(name)
  s = ""
	game_hash.each do |location, team_data|
		team_data.each do |attribute, value|
			if attribute == :players
				value.each do |player, stats|
					if player.to_s == name
						stats.each do |stat, val|
              if stat == :shoe
								s = val
							end
						end
					end
				end
			end
		end
	end
	s.to_i
end


def team_colors(team)
  a = []
	game_hash.each do |location, team_data|
		team_data.each do |attribute, value|
			if value.to_s == team
				a = game_hash[location][:colors]
			end
		end
	end
  a
end


def team_names
  a = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, value|
      if attribute == :team_name
        a << game_hash[location][attribute]
      end
    end
  end
  a
end

def player_numbers(team)
	a = []
	game_hash.each do |location, team_data|
		team_data.each do |attribute, value|
			if value.to_s == team
				game_hash[location][:players].each do |player, stats|
					stats.each do |stat, val|
						if stat == :number
							a << val.to_i
						end
					end
				end
			end
		end
	end
  a
end

def player_stats(name)
	h = ""
	game_hash.each do |location, team_data|
		team_data.each do |attribute, value|
			if attribute == :players
				value.each do |player, stats|
					if player.to_s == name
						h = stats
					end
				end
			end
		end
	end
	h.delete_if {|key, value| key == :player_name}
  h.collect do |key, value|
    h[key] = value.to_i
  end
  h
end

def big_shoe_rebounds
	com_val = 0
  	big_player = ""
  	big_reb = ""
  	game_hash.each do |location, team_data|
		team_data.each do |attribute, value|
			if attribute == :players
				value.each do |player, stats|
					stats.each do |stat, val|
              			if stat == :shoe
							if val.to_i > com_val
								com_val = val.to_i
								big_player = player
							end
						end
					end
				end
			end
		end
	end
	game_hash.each do |location, team_data|
		team_data.each do |attribute, value|
			if attribute == :players
				value.each do |player, stats|
					if player == big_player
						stats.each do |stat, val|
	              			if stat == :rebounds
								big_reb = val
							end
						end
					end
				end
			end
		end
	end
	big_reb.to_i
end


