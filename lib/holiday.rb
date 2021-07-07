require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
holiday_hash[:winter][:christmas] = supply
holiday_hash[:winter][:new_years] = supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
holiday_hash[:spring][:memorial_day] = supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  return holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holder_array =[]
holiday_hash[:winter][:christmas].each do |key|
      holder_array << key
      end
holiday_hash[:winter][:new_years].each do |key|
    holder_array << key
    end
holder_array
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holiday|
      puts season.to_s.capitalize + ":"
      holiday.each do |day, supply|
        puts "  " + day.to_s.gsub(/[^0-9A-Za-z]/, " ").capitalize.split(/\s+/).each { |word| word.capitalize!}.join(' ') + ": " + supply.join(', ')
      end
    end
  end



def all_holidays_with_bbq(holiday_hash)
  holder_array =[]

holiday_hash.each do |season, holiday|
    holiday.each do |holiday, supplies|
      holder_array << holiday if supplies.include?('BBQ')
    end
  end
holder_array
end
# holiday_hash = {
#   :winter => {
#     :christmas => ["Lights", "Wreath"],
#     :new_years => ["Party Hats"]
#   },
#   :summer => {
#     :fourth_of_july => ["Fireworks", "BBQ"]
#   },
#   :fall => {
#     :thanksgiving => ["Turkey"]
#   },
#   :spring => {
#     :memorial_day => ["BBQ"]
#   }
# }
