desc "Create a schedule"
task create_schedule: :environment do
  puts "Reminding users of registration"
  CreateScheduleWorker.new.perform
  puts "done."
end
