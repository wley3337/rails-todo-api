require 'rails_helper'

RSpec.describe List, type: :model do
  before(:all)do
    @u1 = create(:user)
    @l1 = create(:list, user: @u1)
    @l2 = create(:list, user: @u1, heading: "List 2", display_order: 2)
    @td1 = create(:to_do_1, list: @l1)
    @td2 = create(:to_do_2, list: @l1)
    @td3 = create(:to_do_2, list: @l2)
  end
  after(:all)do
    User.destroy_all
    List.destroy_all 
    ToDo.destroy_all
  end
  
  context "relationships" do 
    it "belongs to a user" do 
      expect(@l1.user).to be(@u1)
    end 
    it "has many to-dos" do 
      expect(@l1.to_dos.length).to be(2)
      expect(@l2.to_dos.length).to be(1)
    end
  end
end
