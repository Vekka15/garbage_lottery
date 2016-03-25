class CreateScheduleWorker < AssignationsController
  include Sidekiq::Worker

  def perform
    puts "dziala"
    assignation = Assignation.new
    assignation.save
  end
end
