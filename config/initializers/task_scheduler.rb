require 'rubygems'
require 'rufus-scheduler'

 scheduler = Rufus::Scheduler.new

#scheduler is set to send mails always at forst day of month
 # scheduler.cron '0 0 * * 0' do
 # scheduler.every '5m' do
 #      puts "Test!------"
 #      CreateScheduleWorker.new.perform
 #      Rails.logger.info "running scheduler"
 # end
