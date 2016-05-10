# Question 1

 # In this hash of people and their age,

  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
  # see if there is an age present for "Spot".

  p ages.has_key?("Spot")

 # Bonus: What are two other hash methods that would work just as well for this solution?

 p ages.include?("Spot")

 # this method is not that great since it throws an error if the key isn't found
 # p ages.fetch("Spot")

 p ages.member?("Spot")

#Question 2

  # Add up all of the ages from our current Munster family hash:

  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

  def munster_family_total_ages(ages_hash)
    total_age = 0

    ages_hash.each_value { |age|  total_age += age }

    total_age
  end

  puts munster_family_total_ages(ages)
