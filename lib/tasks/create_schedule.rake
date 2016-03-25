desc "Create a schedule"
task create_schedule: :environment do
  puts "Prepare schedule for this week"
  CreateScheduleWorker.new.perform
  puts "done."
end
