require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    it "redirects to the home page upon save" do
      post :add, user: attributes_for(:user)
      expect(response).to redirect_to users_path
    end

    it "adding user by admin render /user/new" do
      post :add, user: attributes_for(:user, email: nil, admin_add: true)
      expect(response).to render_template 'users/new'
    end

    it "registrating with failure render devise new" do
      post :add, user: attributes_for(:user, email: nil)
      expect(response).to render_template 'devise/registrations/new'
    end

    it "adding user by admin with failure render /user/new" do
      post :add, user: attributes_for(:user, email: nil)
      expect(response).to render_template 'devise/registrations/new'
    end

    it "add new user with success" do
      post :add, user: attributes_for(:user)
      expect(User.count).to eq(1)
    end

    it "not add new user when failure" do
      post :add, user: attributes_for(:user, email: nil)
      expect(User.count).to eq(0)
    end
  end

  describe "GET #new" do
    it "render new form" do
      user = create(:user)
      sign_in user
      get :new
      expect(response).to render_template 'new'
    end

    it "redirect to root if no current user" do
      get :new
      expect(response).to redirect_to root_path
    end

  end

  describe "GET #index" do
    it "render all users" do
      user = create(:user)
      sign_in user
      get :index
      expect(response).to render_template 'index'
    end

    it "redirect to root if no current user" do
      get :index
      expect(response).to redirect_to new_user_session_path
    end
  end
  
end
