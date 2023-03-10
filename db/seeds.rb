Admin.create(
  email: "admin1@example.com",
  password: "password"
)

Customer.create(
  email: "customer1@example.com",
  password: "password"
)

# 1
product = Product.new(
  name: "水筆",
  manufacturer: Faker::Company.name,
  price: 1080,
  description: "水彩画や水筆書道などをに使われる中に水を内蔵することができる筆、水筆（ウォーターブラシ）",
  stock: rand(50),
)
product.image.attach(io: File.open("./db/fixtures/bunbougu_mizufude.png"), filename: 'bunbougu_mizufude.png')
product.save

# 2
product = Product.new(
  name: "ボールペン",
  manufacturer: Faker::Company.name,
  price: 110,
  description: "シンプルな透明のボールペン",
  stock: rand(50),
)
product.image.attach(io: File.open("./db/fixtures/bunbougu_ballpen.png"), filename: 'bunbougu_ballpen.png')
product.save

# 3
product = Product.new(
  name: "製図ペン",
  manufacturer: Faker::Company.name,
  price: 820,
  description: "図面を書くときに便利なペン（シャーペン）",
  stock: rand(50),
)
product.image.attach(io: File.open("./db/fixtures/seizu_pen.png"), filename: 'seizu_pen.png')
product.save

# 4
product = Product.new(
  name: "筆ペン",
  manufacturer: Faker::Company.name,
  price: 320,
  description: "先が筆のようになっていて毛筆のような字を書くことができるペン",
  stock: rand(50),
)
product.image.attach(io: File.open("./db/fixtures/bunbougu_fudepen.png"), filename: 'bunbougu_fudepen.png')
product.save

# 5
product = Product.new(
  name: "定規",
  manufacturer: Faker::Company.name,
  price: 320,
  description: "青い定規",
  stock: rand(50),
)
product.image.attach(io: File.open("./db/fixtures/bunbougu_jougi.png"), filename: 'bunbougu_jougi.png')
product.save

# 6
product = Product.new(
  name: "万年筆",
  manufacturer: Faker::Company.name,
  price: 10500,
  description: "インクを補充して繰り返し使える、黒い万年筆",
  stock: rand(50),
)
product.image.attach(io: File.open("./db/fixtures/pen_mannenhitsu.png"), filename: 'pen_mannenhitsu.png')
product.save

# 7
product = Product.new(
  name: "消しゴム",
  manufacturer: Faker::Company.name,
  price: 80,
  description: "青いカバーのついた消しゴム",
  stock: rand(50),
)
product.image.attach(io: File.open("./db/fixtures/bunbougu_keshigomu.png"), filename: 'bunbougu_keshigomu.png')
product.save

# out of stock
product = Product.new(
  name: "左ハンドル車用のマジックハンド",
  manufacturer: Faker::Company.name,
  price: 2000,
  description: "自動車の窓の外に手が届かないときに使われるマジックハンド",
  stock: 0,
)
product.image.attach(io: File.open("./db/fixtures/car_magichand.png"), filename: 'car_magichand.png')
product.save

# 8
product = Product.new(
  name: "カラフルなマスキングテープ",
  manufacturer: Faker::Company.name,
  price: 350,
  description: "カラフルな柄が印刷されたかわいいマスキングテープ",
  stock: rand(50),
)
product.image.attach(io: File.open("./db/fixtures/bunbougu_masking_tape.png"), filename: 'bunbougu_masking_tape.png')
product.save

# 9
product = Product.new(
  name: "穴あけパンチ",
  manufacturer: Faker::Company.name,
  price: 640,
  description: "青い穴あけパンチ",
  stock: rand(50),
)
product.image.attach(io: File.open("./db/fixtures/bunbougu_anaake_punch.png"), filename: 'bunbougu_anaake_punch.png')
product.save

# 10
product = Product.new(
  name: "鉛筆",
  manufacturer: Faker::Company.name,
  price: 90,
  description: "緑色の一般的な鉛筆",
  stock: rand(50),
)
product.image.attach(io: File.open("./db/fixtures/bunbougu_enpitsu.png"), filename: 'bunbougu_enpitsu.png')
product.save

# 11
product = Product.new(
  name: "修正テープ",
  manufacturer: Faker::Company.name,
  price: 380,
  description: "テープ状の修正液を使って消しゴムのように文字を消せる修正テープ",
  stock: rand(50),
)
product.image.attach(io: File.open("./db/fixtures/bunbougu_syusei_tape.png"), filename: 'bunbougu_syusei_tape.png')
product.save

# 12
product = Product.new(
  name: "ガムテープ",
  manufacturer: Faker::Company.name,
  price: 480,
  description: "シンプルなガムテープ",
  stock: rand(50),
)
product.image.attach(io: File.open("./db/fixtures/tape_gumtape.png"), filename: 'tape_gumtape.png')
product.save

# 13
product = Product.new(
  name: "ハサミ",
  manufacturer: Faker::Company.name,
  price: 580,
  description: "水色のハサミ",
  stock: rand(50),
)
product.image.attach(io: File.open("./db/fixtures/bunbougu_hasami.png"), filename: 'bunbougu_hasami.png')
product.save

# 14
product = Product.new(
  name: "グラスリッツェン",
  manufacturer: Faker::Company.name,
  price: 2500,
  description: "ガラスに模様を彫刻するときに使われる道具、グラスリッツェン",
  stock: rand(50),
)
product.image.attach(io: File.open("./db/fixtures/dougu_glasritzen_.png"), filename: 'dougu_glasritzen_.png')
product.save

# 15
product = Product.new(
  name: "スティックのり",
  manufacturer: Faker::Company.name,
  price: 370,
  description: "水色のラインが入ったスティックのり",
  stock: rand(50),
)
product.image.attach(io: File.open("./db/fixtures/bunbougu_sticknori.png"), filename: 'bunbougu_sticknori.png')
product.save

# 16
product = Product.new(
  name: "カッター",
  manufacturer: Faker::Company.name,
  price: 580,
  description: "オレンジ色のカッター",
  stock: rand(50),
)
product.image.attach(io: File.open("./db/fixtures/bunbougu_cutter.png"), filename: 'bunbougu_cutter.png')
product.save