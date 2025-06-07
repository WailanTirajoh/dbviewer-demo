# This file populates the database with sample data for the e-commerce application demo
# Run with bin/rails db:seed
#
# This seed file is idempotent - it can be safely run multiple times without creating duplicate data
# It uses arrays and loops for easier maintenance and extension

# Only clean up existing data if explicitly requested
if ENV['CLEAN_DB'] == 'true'
  puts "Cleaning database..."
  Review.destroy_all
  OrderItem.destroy_all
  Order.destroy_all
  Address.destroy_all
  Customer.destroy_all
  Product.destroy_all
  Category.destroy_all
else
  puts "Skipping database cleanup. Set CLEAN_DB=true to clean database before seeding."
  # Exit if there's already data to avoid duplicates
  if Category.count > 0
    puts "Data already exists. Exiting to prevent duplicate data."
    puts "Use CLEAN_DB=true bin/rails db:seed to force reseeding."
    exit
  end
end

# Create categories
puts "Creating categories..."

# Main categories data structure
main_categories = [
  { name: "Electronics", description: "Electronic devices and gadgets" },
  { name: "Clothing", description: "Apparel and fashion items" },
  { name: "Home & Kitchen", description: "Items for home and kitchen" },
  { name: "Books", description: "Books, ebooks, and audiobooks" },
  { name: "Sports & Outdoors", description: "Sports equipment and outdoor gear" }
]

# Create main categories
category_records = {}
main_categories.each do |category_data|
  category = Category.find_or_create_by!(name: category_data[:name]) do |c|
    c.description = category_data[:description]
  end
  category_records[category_data[:name]] = category
end

# Subcategories data structure with parent reference
subcategories = [
  # Electronics subcategories
  { name: "Smartphones", description: "Mobile phones and accessories", parent: "Electronics" },
  { name: "Laptops", description: "Notebook computers", parent: "Electronics" },
  { name: "Audio", description: "Headphones, speakers, and audio equipment", parent: "Electronics" },

  # Clothing subcategories
  { name: "Men's Clothing", description: "Clothing items for men", parent: "Clothing" },
  { name: "Women's Clothing", description: "Clothing items for women", parent: "Clothing" },
  { name: "Kids' Clothing", description: "Clothing items for children", parent: "Clothing" },

  # Home & Kitchen subcategories
  { name: "Furniture", description: "Home furniture items", parent: "Home & Kitchen" },
  { name: "Kitchen", description: "Kitchen appliances and accessories", parent: "Home & Kitchen" },
  { name: "Bedding", description: "Sheets, pillows, and bedroom items", parent: "Home & Kitchen" },

  # Books subcategories
  { name: "Fiction", description: "Novels and fiction books", parent: "Books" },
  { name: "Non-Fiction", description: "Non-fiction books", parent: "Books" },
  { name: "Technical", description: "Technical and reference books", parent: "Books" },

  # Sports subcategories
  { name: "Fitness", description: "Fitness equipment", parent: "Sports & Outdoors" },
  { name: "Camping", description: "Camping gear", parent: "Sports & Outdoors" },
  { name: "Team Sports", description: "Equipment for team sports", parent: "Sports & Outdoors" }
]

# Create subcategories
subcategories.each do |subcategory_data|
  parent_category = category_records[subcategory_data[:parent]]
  subcategory = Category.find_or_create_by!(name: subcategory_data[:name]) do |c|
    c.description = subcategory_data[:description]
    c.parent = parent_category
  end
  category_records[subcategory_data[:name]] = subcategory
end

# Create products
puts "Creating products..."

# Products data structure with category reference
products = [
  # Smartphones
  {
    name: "UltraPhone 15",
    description: "Latest smartphone with advanced camera and long battery life",
    price: 999.99,
    stock_quantity: 50,
    category: "Smartphones",
    sku: "SP-ULTRA15-BLK"
  },
  {
    name: "TechPhone Pro",
    description: "Professional-grade smartphone with productivity features",
    price: 1199.99,
    stock_quantity: 30,
    category: "Smartphones",
    sku: "SP-TECHPRO-SLV"
  },
  {
    name: "Budget Phone X",
    description: "Affordable smartphone with great features",
    price: 299.99,
    stock_quantity: 100,
    category: "Smartphones",
    sku: "SP-BUDGETX-GRY"
  },

  # Laptops
  {
    name: "PowerBook Ultra",
    description: "High-performance laptop for professionals",
    price: 1499.99,
    stock_quantity: 25,
    category: "Laptops",
    sku: "LP-PWRBK-ULTRA"
  },
  {
    name: "EduBook Basic",
    description: "Simple laptop for students and basic use",
    price: 599.99,
    stock_quantity: 75,
    category: "Laptops",
    sku: "LP-EDUBOOK-BAS"
  },
  {
    name: "GamerBook Pro",
    description: "Powerful laptop for gaming enthusiasts",
    price: 1899.99,
    stock_quantity: 15,
    category: "Laptops",
    sku: "LP-GAMER-PRO"
  },

  # Audio
  {
    name: "SoundWave Headphones",
    description: "Noise-canceling wireless headphones",
    price: 249.99,
    stock_quantity: 60,
    category: "Audio",
    sku: "AU-SOUNDWAVE-HP"
  },
  {
    name: "BassBoom Speaker",
    description: "Portable Bluetooth speaker with deep bass",
    price: 129.99,
    stock_quantity: 45,
    category: "Audio",
    sku: "AU-BASSBOOM-SPK"
  },

  # Men's Clothing
  {
    name: "Classic Fit Jeans",
    description: "Men's classic fit denim jeans",
    price: 49.99,
    stock_quantity: 120,
    category: "Men's Clothing",
    sku: "CL-MJEANS-CLSC"
  },
  {
    name: "Business Casual Shirt",
    description: "Men's button-up shirt for office wear",
    price: 39.99,
    stock_quantity: 85,
    category: "Men's Clothing",
    sku: "CL-MSHIRT-BUS"
  },

  # Women's Clothing
  {
    name: "Summer Dress",
    description: "Women's light summer dress",
    price: 59.99,
    stock_quantity: 90,
    category: "Women's Clothing",
    sku: "CL-WDRESS-SMR"
  },
  {
    name: "Yoga Pants",
    description: "Stretchy yoga pants for exercise",
    price: 34.99,
    stock_quantity: 110,
    category: "Women's Clothing",
    sku: "CL-WPANTS-YOGA"
  },

  # Kitchen
  {
    name: "Coffee Maker",
    description: "Programmable coffee maker with timer",
    price: 79.99,
    stock_quantity: 40,
    category: "Kitchen",
    sku: "HK-COFFEE-MKR"
  },
  {
    name: "Knife Set",
    description: "Professional chef's knife set",
    price: 149.99,
    stock_quantity: 30,
    category: "Kitchen",
    sku: "HK-KNIFE-SET"
  },

  # Books
  {
    name: "Mystery at Midnight",
    description: "Thrilling mystery novel",
    price: 14.99,
    stock_quantity: 200,
    category: "Fiction",
    sku: "BK-MYST-MIDNT"
  },
  {
    name: "Ruby Programming",
    description: "Learn Ruby programming language",
    price: 39.99,
    stock_quantity: 50,
    category: "Technical",
    sku: "BK-RUBY-PROG"
  },
  {
    name: "History of Innovation",
    description: "Non-fiction book about technology innovation",
    price: 24.99,
    stock_quantity: 70,
    category: "Non-Fiction",
    sku: "BK-HIST-INNOV"
  },

  # Sports
  {
    name: "Yoga Mat",
    description: "Premium non-slip yoga mat",
    price: 29.99,
    stock_quantity: 65,
    category: "Fitness",
    sku: "SP-YOGA-MAT"
  },
  {
    name: "Camping Tent",
    description: "3-person waterproof camping tent",
    price: 129.99,
    stock_quantity: 25,
    category: "Camping",
    sku: "SP-CAMP-TENT3"
  },
  {
    name: "Basketball",
    description: "Official size basketball",
    price: 24.99,
    stock_quantity: 80,
    category: "Team Sports",
    sku: "SP-BBALL-OFF"
  }
]

# Create products
products.each do |product_data|
  # Find the category by name
  category = category_records[product_data[:category]]

  # Create the product if it doesn't exist
  Product.find_or_create_by!(sku: product_data[:sku]) do |p|
    p.name = product_data[:name]
    p.description = product_data[:description]
    p.price = product_data[:price]
    p.stock_quantity = product_data[:stock_quantity]
    p.category = category
  end
end

# Create customers
puts "Creating customers..."

# Customer data arrays
first_names = [
  "James", "Mary", "John", "Patricia", "Robert", "Jennifer", "Michael", "Linda", "David", "Elizabeth",
  "William", "Susan", "Richard", "Jessica", "Joseph", "Sarah", "Thomas", "Karen", "Charles", "Nancy"
]

last_names = [
  "Smith", "Johnson", "Williams", "Jones", "Brown", "Davis", "Miller", "Wilson", "Moore", "Taylor",
  "Anderson", "Thomas", "Jackson", "White", "Harris", "Martin", "Thompson", "Garcia", "Martinez", "Robinson"
]

# Customer lookup hash for later use
customer_records = {}

# Create customers using the arrays
first_names.each_with_index do |first_name, i|
  last_name = last_names[i]
  email = "#{first_name.downcase}.#{last_name.downcase}@example.com"

  # Create customer if it doesn't exist
  customer = Customer.find_or_create_by!(email: email) do |c|
    c.first_name = first_name
    c.last_name = last_name
    c.phone = "555-#{100 + i}-#{1000 + i}"
  end

  customer_records[email] = customer
end

# Create addresses
puts "Creating addresses..."

# City and state arrays for addresses
cities = [ "New York", "Los Angeles", "Chicago", "Houston", "Phoenix", "Philadelphia", "San Antonio", "San Diego", "Dallas", "San Jose" ]
states = [ "NY", "CA", "IL", "TX", "AZ", "PA", "FL", "OH", "MI", "GA" ]

# Create addresses for each customer
customer_records.values.each do |customer|
  # Create a shipping address if it doesn't exist yet
  if customer.addresses.shipping.count == 0
    Address.create!(
      customer: customer,
      address_type: "shipping",
      street: "#{100 + rand(900)} Main St",
      city: cities.sample,
      state: states.sample,
      zip_code: "#{10000 + rand(90000)}",
      country: "USA",
      default: true
    )
  end

  # Create a billing address if it doesn't exist yet
  if customer.addresses.billing.count == 0
    # 70% of customers have same billing address as shipping
    if rand < 0.7
      shipping_addr = customer.addresses.shipping.first
      Address.create!(
        customer: customer,
        address_type: "billing",
        street: shipping_addr.street,
        city: shipping_addr.city,
        state: shipping_addr.state,
        zip_code: shipping_addr.zip_code,
        country: shipping_addr.country,
        default: true
      )
    else
      # 30% have different billing address
      Address.create!(
        customer: customer,
        address_type: "billing",
        street: "#{100 + rand(900)} Business Rd",
        city: cities.sample,
        state: states.sample,
        zip_code: "#{10000 + rand(90000)}",
        country: "USA",
        default: true
      )
    end
  end
end

# Create orders
puts "Creating orders..."

# Order statuses
statuses = [ "pending", "processing", "shipped", "delivered", "canceled" ]

# List of positive and negative review comments for reuse
positive_comments = [
  "Great product! Exactly what I needed.",
  "Very satisfied with my purchase.",
  "Arrived quickly and works perfectly.",
  "Good quality for the price.",
  "Would recommend to others.",
  "Not perfect but does the job.",
  "Better than expected!",
  "Will definitely buy again."
]

negative_comments = [
  "Not what I expected.",
  "Poor quality for the price.",
  "Arrived damaged.",
  "Doesn't work as described.",
  "Wouldn't recommend.",
  "Disappointed with this product."
]

# Get products for random selection - make this deterministic by fetching by SKU
products_by_sku = {}
Product.all.each do |product|
  products_by_sku[product.sku] = product
end
products = products_by_sku.values

# Generate random but deterministic orders for each customer
customer_records.values.each do |customer|
  # Use customer id as seed to make randomization deterministic but varied
  seed = customer.id || customer.email.sum
  random = Random.new(seed)

  # Each customer has 0-3 orders
  random.rand(0..3).times do |i|
    order_number = "ORD-#{customer.id}-#{i}-#{SecureRandom.hex(2).upcase}"

    # Skip if this order already exists
    next if Order.exists?(order_number: order_number)

    # Get addresses for this customer
    shipping_address = customer.addresses.shipping.first
    billing_address = customer.addresses.billing.first

    # Create order
    order = Order.create!(
      customer: customer,
      order_number: order_number,
      order_date: Time.now - random.rand(1..60).days,
      status: statuses.sample(random: random),
      total_amount: 0, # Will be updated after adding items
      shipping_address: shipping_address,
      billing_address: billing_address
    )

    # Add 1-5 items to each order
    order_total = 0
    random.rand(1..5).times do
      # Select a random product
      product = products.sample(random: random)
      quantity = random.rand(1..3)

      # Create order item
      OrderItem.create!(
        order: order,
        product: product,
        quantity: quantity,
        unit_price: product.price
        # subtotal will be set by the model callback
      )

      order_total += (product.price * quantity)
    end

    # Update order total
    order.update!(total_amount: order_total)

    # Create reviews for delivered orders
    if order.status == "delivered"
      order.products.each do |product|
        # Skip if review already exists
        next if Review.exists?(product_id: product.id, customer_id: customer.id)

        # 80% chance of leaving a review
        if random.rand < 0.8
          Review.create!(
            product: product,
            customer: customer,
            rating: random.rand(3..5), # Most customers leave positive reviews
            comment: positive_comments.sample(random: random)
          )
        end
      end
    end
  end
end

# Create some additional negative reviews for realism
# Use a fixed seed for reproducibility
negative_review_seed = 12345
negative_random = Random.new(negative_review_seed)

# Limit to 10 negative reviews
negative_review_count = [ 10, Product.count ].min
negative_review_count.times do
  product = products.sample(random: negative_random)
  customer = customer_records.values.sample(random: negative_random)

  # Skip if review already exists
  next if Review.exists?(product_id: product.id, customer_id: customer.id)

  Review.create!(
    product: product,
    customer: customer,
    rating: negative_random.rand(1..2),
    comment: negative_comments.sample(random: negative_random)
  )
end

puts "Seed data created successfully!"
