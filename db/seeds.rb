# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['user', 'resident', 'partner', 'admin'].each do |role|
  Role.find_or_create_by_name role
end

donor = Donor.create([ { name: "You", org: "StillYou.org" }])
donation = Donation.create([ { amount: 100 } ])

donation.donor.create(name: "You!")