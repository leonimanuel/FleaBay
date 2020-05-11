require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
condition = ["excellent", "good", "fair", "poor"]

billy = User.create(name: "Billy", email: "billy@aol.com", password: "greenbeans")
claire = User.create(name: "Claire", email: "claire@gmail.com", password: "fishsticks")
ashley = User.create(name: "Ashley", email: "ashley@yahoo.com", password: "milkmaid")
megan = User.create(name: "Megan", email: "megan@aol.com", password: "greenbeans")
ben = User.create(name: "Ben", email: "ben@gmail.com", password: "fishsticks")
luke = User.create(name: "Luke", email: "luke@yahoo.com", password: "milkmaid")

# bike = Item.create(name: "Bike", condition: "good", user: billy)
# toaster = Item.create(name: "Toaster", condition: "excellent", user: megan)
# piano = Item.create(name: "Piano", condition: "excellent", user: billy)

10.times do
	Category.create(name: Faker::Commerce.department)
end

50.times do
	auction = Auction.create(user: User.all.sample)
	auction.update(starting_price: Faker::Commerce.price(range: 0..500.0))
	auction.update(close_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now + 3))
	auction.categories << Category.all.sample

	item = Item.create(name: Faker::Commerce.product_name, 
		condition: condition.sample,
		user: auction.user,
		auction: auction
	)

end




