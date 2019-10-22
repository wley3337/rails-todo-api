require 'rails_helper'

RSpec.describe User, type: :model do
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


  context "validations" do 
    it "validates username uniquness case insensitive" do 
      u2 = build(:user, first_name: "John", username: "bob123")
      u2.save 
      expect(u2.errors.full_messages[0]).to eq("Username has already been taken")
    end
  end
  
  context "relationships" do 
    it "has many lists" do 
      expect(@u1.lists.length).to be(2)
    end 
    it "has many to-dos through lists (non-sorted)" do
      expect(@u1.to_dos.length).to be(3) 
    end 
  end


end
