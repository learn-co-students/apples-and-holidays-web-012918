def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each do |holiday, supplies_array|
    supplies_array << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  winter_supplies = []

  holiday_hash[:winter].each do |holiday, supplies_array|
    supplies_array.each do |supply|
      winter_supplies << supply
    end
  end

  winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holidays|
    puts "#{season.to_s.capitalize!}:"

    holidays.each do |holiday, supplies|
      if holiday.to_s.include?('_')
        holiday_array = holiday.to_s.gsub!('_',' ').split
        holiday_array.each {|s| s.capitalize!}
        puts "  #{holiday_array.join(' ')}: #{supplies.join(', ')}"
      else
        puts "  #{holiday.to_s.capitalize!}: #{supplies.join(', ')}"
      end
    end

  end
end

def all_holidays_with_bbq(holiday_hash)
  bbq_holidays = []

  holiday_hash.each do |season, holidays|
    holidays.each do |holiday, supplies|
      supplies.include?("BBQ") ? bbq_holidays << holiday : nil
    end
  end

  bbq_holidays
end
