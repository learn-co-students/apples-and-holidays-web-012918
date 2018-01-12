require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
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
  # return the second element in the 4th of July array
  supply = ""
  holiday_hash.each do |season, holidays|
    holidays.each do |holidays, supplies|
      if holidays == :fourth_of_july
        supply = supplies[1]
      end
    end
  end
  supply
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |seasons, holidays|
    holidays.each do |holidays, supplies|
      if holidays == :christmas || holidays == :new_years
        supplies.push(supply)
      end
    end
  end
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |seasons, holidays|
    holidays.each do |holidays, supplies|
      if holidays == :memorial_day
        supplies.push(supply)
      end
    end
  end

  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash.each do |seasons, holiday|
    if seasons == season
      holiday_hash[seasons][holiday_name] = supply_array
    end
  end
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  return_array = []
  # return an array of all of the supplies that are used in the winter season
  holiday_hash.each do |seasons, holidays|
    if seasons == :winter
      holidays.each do |holidays, supplies|
        return_array << supplies
      end
    end
  end
  return_array.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  reads = ""
  holiday_hash.each do |seasons, holidays|
    reads << "#{seasons.to_s.capitalize}:\n"
    holidays.each do |holiday, supplies|
      holiday_string = holiday.to_s
      if holiday_string.include?("_")
        holiday_string.gsub!(/[_]/, " ")
        holiday_name = holiday_string.split
        holiday_name.each do |item|
          item.capitalize!
          if item == holiday_name.last
          else
            item << " "
          end
        end
        holiday_string = holiday_name.join
      else holiday_string = holiday.capitalize
      end
      reads << "  #{holiday_string}: "
      supplies.each do |supply|
        if supply == supplies.last
          reads << "#{supply}\n"
        else
        reads << "#{supply}, "
        end
      end
    end
  end
  puts reads
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  return_array = []
    holiday_hash.each do |season, holiday|
      holiday.each do |holiday, supplies|
        if supplies.include?("BBQ")
          return_array.push(holiday)
        end
      end
    end
  return_array
end
