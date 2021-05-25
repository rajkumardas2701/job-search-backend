require 'rails_helper'

RSpec.describe App, type: :model do
  describe "associations" do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:job).class_name('Job') }
  end

  describe "class methods" do
    describe "app_add" do
      it "should return true if App is created" do
        
      end

      it "should return false if App already exist" do
      end
    end

    describe "fetch_apps" do
      it "should return users in the App"
    end
  end
end