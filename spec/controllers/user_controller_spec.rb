require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do

    it "redirects to the home page upon save" do
      post :add, user: attributes_for(:user)
      expect(response).to redirect_to users_path
    end

    it "adding user by admin witf failure render /user/new" do
      post :add, user: attributes_for(:user, email: nil)
      expect(response).to render_template 'users/new'
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

  describe "DELETE #delete" do
    it "delete user with success" do
      @user = create(:user)
      expect(User.count).to eq(1)
      delete :delete, id: @user.id
      expect(User.count).to eq(0)
    end

    it "change assignations with user delete" do
      @user = create(:user, email: 'test@prograils.com')
      @user1 = create(:user, email: 'test1@prograils.com')
      create(:assignation, user_mail: 'test@prograils.com')
      create(:assignation, user_mail: 'test@prograils.com')
      create(:assignation, user_mail: 'test@prograils.com')
      create(:assignation, user_mail: 'test@prograils.com')
      create(:assignation, user_mail: 'test@prograils.com')
      expect(User.count).to eq(2)
      expect(Assignation.where(user_mail:'test@prograils.com').count).to eq(5)
      delete :delete, id: @user.id
      expect(User.count).to eq(1)
      expect(Assignation.where(user_mail:'test@prograils.com').count).to eq(0)
      expect(Assignation.where(user_mail:'test1@prograils.com').count).to eq(5)
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

    it "redirect to sign in if no current user" do
      get :index
      expect(response).to redirect_to new_user_session_path
    end
  end
end
