require 'pry'

def contestants(data)
  data.values.flatten
end

def get_first_name_of_season_winner(data, season)
  contestants = data[season]
  winner = contestants.find do |contestant|
    contestant["status"] == "Winner"
  end
  winner["name"].split(' ')[0]
end



def get_contestant_name(data, occupation)
 match = contestants(data).find do |contestant|
  contestant["occupation"] == occupation
 end
 match["name"]
 
end

# def get_contestant_name(data, occupation)
#   find_by_occupation = data.map  {|season, cast|
#     cast}
#     .flatten
#     .find{|contestant| contestant["occupation"] == occupation}
#     find_by_occupation["name"]
# end

def count_contestants_by_hometown(data, hometown)
  contestants(data).select do |contestant| 
    contestant["hometown"] == hometown
  end
  .count()
end


# def count_contestants_by_hometown(data, hometown)
#   counter = 0
#   cast_array = data.map do {|season, cast| cast}
#   .flatten
#   cast_array.each do |contestant|
#     if contestant["hometown"] == hometown
#       counter += 1
#     end
#   end
#   counter
# end


def get_occupation(data, hometown)
  find_by_hometown = data.map{|season, cast| cast}
  .flatten
  .find{|contestant| contestant["hometown"] == hometown}
  find_by_hometown["occupation"]
end

def get_average_age_for_season(data, season)
  age_array = data[season].map{|cast| cast["age"].to_i}
  .flatten
  age_num = age_array.reduce{|sum, age| sum + age} / age_array.length.to_f
  age_num.round
end



