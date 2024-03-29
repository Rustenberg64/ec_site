FactoryBot.define do
  factory :product do
    name { "sample" }
    manufacturer { "manufacturer" }
    price { 123_456_789 }
    description { "this is sample" }
    stock { 10 }
    image { Rack::Test::UploadedFile.new(Rails.root.join("#{Rails.root}/spec/factories/images/sample.png"), 'image/png') }
  end
end
