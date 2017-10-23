module SeedingMethods
  def self.get_name
    Faker::Name.name
  end

  def self.get_email
    Faker::Internet.free_email
  end

  def self.get_title
    Faker::Lorem.sentence(1, true, 4)
  end

  def self.get_body
    Faker::Lorem.sentence(1, true, 4) + " " + Faker::Lorem.sentence(1, true, 4) + " " + Faker::Lorem.sentence(1, true, 4)
  end
end
