require 'pry'

holiday_hash =
 {
   :winter => {
     :christmas => ["Lights", "Wreath"],
     :new_years => ["Party Hats"]
   },
   :summer => {
     :fourth_of_july => ["Fireworks", "BBQ"]
   },
   :fall => {
     :thanksgiving => ["Turkey"]
   },
   :spring => {
     :memorial_day => ["BBQ"]
   }
 }

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter][:christmas] + holiday_hash[:winter][:new_years]
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holiday|
    cap_seas = season.to_s.capitalize
    puts "#{cap_seas}:"
    holiday.each do |holiday, supply|
      hol_arr = holiday.to_s.split("_")
      cap_hol_arr = hol_arr.map {|x| x.capitalize}
      cap_hol = cap_hol_arr.join(" ")
      puts "  #{cap_hol}: #{supply.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  ret_arr = []
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday, supply|
      if supply.index("BBQ") != nil
        ret_arr.push(holiday)
      end
    end
  end
  ret_arr
end
