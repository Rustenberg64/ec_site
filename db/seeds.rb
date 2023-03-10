Admin.create!(
  email: "admin1@example.com",
  password: "password"
)

Customer.create!(
  email: "customer1@example.com",
  password: "password"
)

product1 = Product.new(
  name: "左ハンドル車用のマジックハンド",
  manufacturer: Faker::Company.name,
  price: 2000,
  description: "自動車の窓の外に手が届かないときに使われるマジックハンド",
  stock: rand(50),
  # image: File.open("db/fixtures/car_magichand.png")
)
product1.image.attach(io: File.open("./db/fixtures/car_magichand.png"), filename: 'car_magichand.png')
product1.save!