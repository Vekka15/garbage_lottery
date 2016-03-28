require 'rails_helper'

RSpec.describe AssignationsController, type: :controller do
  describe "POST #create" do
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

  describe "POST #restart"
    it "restart creating new assignations" do
      create(:user)
      post :restart
      expect(Assignation.count).to eq(7)
    end
  end


end
