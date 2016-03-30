require 'rubygems'
require 'rufus-scheduler'

 scheduler = Rufus::Scheduler.new

#scheduler is set to send mails always at 0 hour 0 minutes every Monday
 scheduler.cron '0 0 * * 0' do
      puts "Test!------"
      CreateScheduleWorker.new.perform
      Rails.logger.info "running scheduler"
 end
