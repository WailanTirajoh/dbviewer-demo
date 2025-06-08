
# Create sample companies
puts "Creating sample companies..."
acme_corp = Company.create!(
  name: "Acme Corporation",
  description: "A global leader in innovative solutions across various industries.",
  website: "https://www.acmecorp.example",
  email: "info@acmecorp.example",
  phone: "+1-555-123-4567",
  address: "123 Main Street",
  city: "San Francisco",
  state: "CA",
  zip_code: "94105",
  country: "USA",
  social_media: {
    twitter: "acmecorp",
    linkedin: "acme-corporation",
    facebook: "acmecorporation"
  }
)

tech_innovations = Company.create!(
  name: "Tech Innovations",
  description: "Cutting-edge technology solutions for modern businesses.",
  website: "https://www.techinnovations.example",
  email: "contact@techinnovations.example",
  phone: "+1-555-987-6543",
  address: "456 Tech Boulevard",
  city: "Austin",
  state: "TX",
  zip_code: "78701",
  country: "USA",
  social_media: {
    twitter: "techinnovations",
    linkedin: "tech-innovations-inc",
    github: "techinnovations"
  }
)

# Create categories
puts "Creating categories..."
technology = CategoryProfile.create!(name: "Technology", description: "Articles about the latest technology trends")
business = CategoryProfile.create!(name: "Business", description: "Business strategies and insights")
design = CategoryProfile.create!(name: "Design", description: "UI/UX and product design articles")
development = CategoryProfile.create!(name: "Development", description: "Programming tips and tutorials")
marketing = CategoryProfile.create!(name: "Marketing", description: "Digital marketing strategies")

# Create employees
puts "Creating employees..."
john_doe = Employee.create!(
  company: acme_corp,
  name: "John Doe",
  email: "john.doe@acmecorp.example",
  position: "Chief Technology Officer",
  bio: "John has over 15 years of experience in software development and technology leadership.",
  active: true
)

jane_smith = Employee.create!(
  company: acme_corp,
  name: "Jane Smith",
  email: "jane.smith@acmecorp.example",
  position: "Marketing Director",
  bio: "Jane leads our marketing initiatives with a focus on digital transformation.",
  active: true
)

alex_johnson = Employee.create!(
  company: tech_innovations,
  name: "Alex Johnson",
  email: "alex.j@techinnovations.example",
  position: "Lead Developer",
  bio: "Alex specializes in cloud architecture and distributed systems.",
  active: true
)

# Create posts
puts "Creating posts..."
post1 = Post.create!(
  company: acme_corp,
  author: john_doe,
  title: "The Future of Cloud Computing",
  content: "Cloud computing continues to transform how businesses operate in the digital age...",
  excerpt: "An exploration of emerging trends in cloud technology",
  status: "published",
  published_at: 2.days.ago
)

post2 = Post.create!(
  company: acme_corp,
  author: jane_smith,
  title: "Effective Digital Marketing Strategies for 2025",
  content: "As we navigate through 2025, digital marketing continues to evolve at a rapid pace...",
  excerpt: "Learn about the latest digital marketing trends",
  status: "published",
  published_at: 5.days.ago
)

post3 = Post.create!(
  company: tech_innovations,
  author: alex_johnson,
  title: "Building Scalable Microservices",
  content: "Microservices architecture offers numerous benefits for large-scale applications...",
  excerpt: "A comprehensive guide to microservices implementation",
  status: "published",
  published_at: 1.week.ago
)

# Associate posts with categories
puts "Associating posts with categories..."
PostCategory.create!(post: post1, category: technology)
PostCategory.create!(post: post1, category: business)
PostCategory.create!(post: post2, category: marketing)
PostCategory.create!(post: post3, category: technology)
PostCategory.create!(post: post3, category: development)

# Create comments
puts "Creating comments..."
Comment.create!(
  post: post1,
  author_name: "Michael Brown",
  author_email: "michael@example.com",
  content: "Great article! I'm curious about how these trends will affect small businesses.",
  status: "approved"
)

Comment.create!(
  post: post1,
  author_name: "Sarah Wilson",
  author_email: "sarah@example.com",
  content: "I've been implementing some of these cloud solutions and can confirm they're game-changers.",
  status: "approved"
)

Comment.create!(
  post: post2,
  author_name: "David Lee",
  author_email: "david@example.com",
  content: "The section on social media marketing was particularly insightful.",
  status: "approved"
)

# Create testimonials
puts "Creating testimonials..."
Testimonial.create!(
  company: acme_corp,
  author_name: "Robert Chen",
  author_position: "CEO",
  author_company: "Global Solutions Inc.",
  content: "Working with Acme Corporation transformed our business processes and increased our efficiency by 30%.",
  rating: 5,
  featured: true
)

Testimonial.create!(
  company: tech_innovations,
  author_name: "Lisa Rodriguez",
  author_position: "CTO",
  author_company: "Future Finance",
  content: "Tech Innovations delivered a robust solution that exceeded our expectations.",
  rating: 5,
  featured: true
)

# Create services
puts "Creating services..."
Service.create!(
  company: acme_corp,
  name: "Cloud Migration",
  description: "Seamless migration of your infrastructure to the cloud with zero downtime.",
  price: 5000,
  price_unit: "project",
  featured: true,
  display_order: 1
)

Service.create!(
  company: acme_corp,
  name: "Digital Transformation Consulting",
  description: "Expert guidance on transforming your business for the digital age.",
  price: 200,
  price_unit: "hour",
  featured: true,
  display_order: 2
)

Service.create!(
  company: tech_innovations,
  name: "Custom Software Development",
  description: "Tailor-made software solutions designed to meet your specific business needs.",
  price: 10000,
  price_unit: "project",
  featured: true,
  display_order: 1
)

puts "Seed data creation completed!"
