class AssignationsController < ApplicationController
  def index
    @assignations = Assignation.all
  end

  def restart
    CreateScheduleWorker.new.perform
    redirect_to root_path
  end
end
