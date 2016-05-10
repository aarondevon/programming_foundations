#Question 2

  # Add up all of the ages from our current Munster family hash:

  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

def munster_family_total_ages(ages_hash)
  total_age = 0

  ages_hash.each_value { |age|  total_age += age }

  total_age
end

puts munster_family_total_ages(ages)
