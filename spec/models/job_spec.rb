require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'associations' do
    it { should have_many(:apps) }
    it { should have_many(:users).through(:apps) }
  end
end
