require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "POST #create" do
    it "redirects to the home page upon save" do
      post :create, user: attributes_for(:user)
      expect(response).to redirect_to root_path
    end

    it "adding user by admin render /user/new" do
      post :create, user: attributes_for(:user, email: nil, admin_add: true)
      expect(response).to render_template 'users/new'
    end

    it "registrating with failure render devise new" do
      post :create, user: attributes_for(:user, email: nil)
      expect(response).to render_template 'devise/registrations/new'
    end

    it "adding user by admin with failure render /user/new" do
      post :create, user: attributes_for(:user, email: nil)
      expect(response).to render_template 'devise/registrations/new'
    end

    it "add new user with success" do
      post :create, user: attributes_for(:user)
      expect(User.count).to eq(1)
    end

    it "not add new user when failure" do
      post :create, user: attributes_for(:user, email: nil)
      expect(User.count).to eq(0)
    end


  end

  describe "GET #new" do
    it "render new form" do
      get :new
      expect(response).to render_template 'new'
    end

    it "invated user is passing value" do
      get :new, {invitation_id: 'test1@prograils.com'}
      expect(controller.params[:invitation_id]).to_not be_nil
      post :create, user: attributes_for(:user, email: controller.params[:invitation_id])
      expect(User.first.email).to eq('test1@prograils.com')
    end
  end

  describe "GET #index" do
    it "render all users" do
      get :index
      expect(response).to render_template 'index'
    end
  end
end
