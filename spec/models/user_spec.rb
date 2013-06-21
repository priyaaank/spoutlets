require 'spec_helper'

describe User do
  describe ".fetch_categories" do
    before do
      @user = FactoryGirl.create(:user)
      %w(dreams/sleep sex/relationships work/school).each do |c|
        FactoryGirl.create(:entry, category: c)
      end
    end
    it "should return an array of categories" do
      @user.fetch_categories.should == [["dreams/sleep", 1],
                                            ["sex/relationships", 1],
                                            ["work/school", 1]]
    end
  end
end
