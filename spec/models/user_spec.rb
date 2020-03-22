require 'rails_helper'

RSpec.describe User, type: :model do

  context 'List of roles' do
    it 'should retrun list of roles' do
      expect(User.test.class).to eq(Hash)
    end
  end
end