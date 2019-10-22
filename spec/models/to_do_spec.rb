require 'rails_helper'

RSpec.describe ToDo, type: :model do
  before(:all)do
    @u1 = create(:user)
    @l1 = create(:list, user: @u1)
    @l2 = create(:list, user: @u1, heading: "List 2", display_order: 2)
    @td1 = create(:to_do_1, list: @l1)
    @td2 = create(:to_do_2, list: @l2)
  end
  after(:all)do
    User.destroy_all
    List.destroy_all 
    ToDo.destroy_all
  end

  context "relationships" do 
    it "belongs to a list" do 
      expect(@td1.list).to be(@l1)
      expect(@td2.list).to be(@l2)
    end
  end
end
