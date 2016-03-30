require 'rails_helper'

RSpec.describe InvitationsController, type: :controller do
  describe "POST #create" do
    it "redirects to the home page upon save" do
      post :create, invitation: attributes_for(:invitation)
      expect(response).to redirect_to invitations_path
    end

    it "add new invitation after successfull creat" do
      post :create, invitation: attributes_for(:invitation)
      expect(Invitation.count).to eq(1)
    end

    it "render new form after failure" do
      post :create, invitation: attributes_for(:invitation, email: nil)
      expect(response).to render_template 'new'
    end

    it "rdont add new invitation after failure" do
      post :create, invitation: attributes_for(:invitation, email: nil)
      expect(Invitation.count).to eq(0)
    end
  end

  describe "GET #index" do

    it "index end with success with current user" do
      @user = create(:user)
      sign_in @user
      get :index
      expect(response).to be_success
    end

    it "index redirect with no current user" do
      get :index
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe "GET #new" do

    it "render new form with current user and admin" do
      @user = create(:user)
      sign_in @user
      get :new
      expect(response).to render_template 'new'
    end

    it "redirect sign in without current_user" do
      get :new
      expect(response).to redirect_to root_path
    end
  end

end
