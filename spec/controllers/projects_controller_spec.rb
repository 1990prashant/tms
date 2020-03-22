require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  let(:user) { User.create(email: "test@email.com", password: "123456", password_confirmation: "123456") }
  let(:role) { Role.create(name: "admin") }
  let(:role_user) { RoleUser.create(user_id: user.id, role_id: role.id) }
  # let(:project) { Project.create }

  before(:each) do
    role_user
    sign_in user
  end

  context 'list of Projects' do
    it 'will list of projects belongs to logged in user' do
      get :index
      expect(response).to be_success
    end
  end

  context 'create a new Project' do
    it 'should create a new project successfully' do
      post :create, params: { project: { name: 'test project', description: 'test description' } }
      expect(response.status).to eq(302)
    end
  end

end