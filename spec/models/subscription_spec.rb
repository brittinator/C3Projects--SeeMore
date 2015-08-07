require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe "validations" do
    let(:space)  { create :subscription }

    context "user_id and followee_id are required" do
      it "subscription is valid" do
        expect(space).to be_valid
      end

      it "subscription invalid if missing user_id" do
        space.user_id = nil
        expect(space).to be_invalid
      end

      it "subscription invalid if missing followee_id" do
        space.followee_id = nil
        expect(space).to be_invalid
      end
    end # context
  end #describe
end # Rspec