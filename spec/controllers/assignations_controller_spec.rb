require 'rails_helper'

RSpec.describe AssignationsController, type: :controller do
  describe "GET #index" do
    it "index end with success with current user" do
      user = create(:user)
      sign_in user
      get :index
      expect(response).to be_success
    end

    it "index redirect with no current user" do
      get :index
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe "POST #restart" do
    before do
      @user = create(:user)
      sign_in @user
    end

    it "restart creating new assignations" do
      post :restart
      expect(Assignation.count).to eq(7)
    end

    it "restart creating new assignations with proper dates" do
      post :restart
      start = Date.today.at_beginning_of_week
      assignation = Assignation.all
      assignation.each_with_index do |a,index|
        expect(a.day.strftime('%d-%m-%Y')).to eq((start+index).strftime('%d-%m-%Y'))
      end
    end
  end
end
