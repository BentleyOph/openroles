# lib/tasks/alerts.rake
namespace :alerts do
  desc "Check for new jobs that match existing alerts and send notifications"
  task check: :environment do
    puts "Starting alert check..."
    # Use perform_now so we can see the output immediately in the console
    AlertMatcherJob.perform_now
    puts "Alert check complete."
  end
end