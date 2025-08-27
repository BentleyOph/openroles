class AlertMatcherJob < ApplicationJob
  queue_as :default

  def perform
    # Find jobs created in the last 24 hours (or adjust as needed)
    new_jobs = Job.where("created_at > ?", 24.hours.ago)

    if new_jobs.empty?
      puts "No new jobs found. Exiting."
      return
    end

    # Iterate over every alert in the system
    Alert.find_each do |alert|
      # Perform a search for the alert's query
      # Use .results to get the array of Job objects
      search_results = Job.search(alert.query, match: :word).results

      # Find the intersection of new jobs and the search results for this alert
      matched_jobs = new_jobs.to_a & search_results

      if matched_jobs.any?
        puts "Found #{matched_jobs.count} new job(s) for alert ##{alert.id} ('#{alert.query}')"
        # If there's a match, send the email.
        # .deliver_later queues the email sending in GoodJob.
        AlertMailer.with(alert: alert, jobs: matched_jobs).new_jobs_found.deliver_later
      end
    end
  end
end