admin = User.create(
  email: 'admin@admin.com',
  password: 'secret',
  password_confirmation: 'secret',
  role: :admin
)

PRODUCTS_COUNT = 100
MAX_CATEGORIES = 3

CATEGORIES = Faker::Base.fetch_all('commerce.department').map do |name|
  Category.find_or_create_by!(name: name)
end

PRODUCTS_COUNT.times do
  name = ''

  loop do
    name = Faker::Commerce.product_name
    break unless Product.exists?(name: name)
  end

  product = Product.new(
    name: name,
    price: Faker::Commerce.price,
    on_stock: rand(100)
  )

  num_categories = 1 + rand(MAX_CATEGORIES)
  product.categories = CATEGORIES.sample(num_categories)

  product.save!
end