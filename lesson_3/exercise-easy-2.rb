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

# Question 3

  # In the age hash:

  ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
  # throw out the really old people (age 100 or older).

  ages.select! do |key, value|
    value < 100
  end

#Question 4

  # Starting with this string:

  munsters_description = "The Munsters are creepy in a good way."
  # Convert the string in the following ways (code will be executed on original munsters_description above):

  # "The munsters are creepy in a good way."
  puts munsters_description.capitalize

  # "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
  puts munsters_description.swapcase

  # "the munsters are creepy in a good way."
  puts munsters_description.downcase

  # "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
  puts munsters_description.upcase
