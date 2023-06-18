FactoryBot.define do
  factory :product do
    name { "sample" }
    manufacturer { "manufacturer" }
    price { 1000 }
    description { "this is sample" }
    stock { 10 }
    image { Rack::Test::UploadedFile.new(Rails.root.join("/home/yasuda/enviroment/ec_site/spec/factories/images/sample.png"), 'image/png') }
  end
end
