class AssignationsController < ApplicationController
  def index
    @assignations = Assignation.all
  end
end
