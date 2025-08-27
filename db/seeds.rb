puts "Destroying existing data..."
Company.destroy_all

puts "Creating companies and jobs..."

uber = Company.create!(name: "Uber", description: "A transportation and logistics company.")
google = Company.create!(name: "Google", description: "A multinational technology company specializing in Internet-related services.")
startup = Company.create!(name: "Stealth Startup", description: "A small, innovative tech company.")

Job.create!([
  { title: "Senior Software Engineer", description: "Build the future of transportation with Ruby and Go.", company: uber, remote: false },
  { title: "Product Marketing Manager", description: "Market our new suite of cloud products.", company: google, remote: false },
  { title: "Remote Python Developer", description: "Work on our core data science stack from anywhere.", company: startup, remote: true },
  { title: "Backend Engineer (Payments)", description: "Join the team that processes millions of transactions.", company: uber, remote: true },
  { title: "UX Designer", description: "Design intuitive interfaces for Google Search.", company: google, remote: false }
])

puts "Seeding complete."

puts "Reindexing Job data in Elasticsearch..."
Job.includes(:company).reindex
puts "Reindexing complete."
