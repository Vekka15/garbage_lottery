class AssignationsController < ApplicationController
  def index
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @begin = Date.today
      @assignations = Assignation.all
    end
  end

  def restart
    CreateScheduleWorker.new.perform
    redirect_to root_path
  end
end
