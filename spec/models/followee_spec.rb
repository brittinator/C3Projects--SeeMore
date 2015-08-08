require 'rails_helper'

RSpec.describe Followee, type: :model do
  describe "model validations" do
    context "valid" do
      let (:followee) { create :followee }

      it "requires a handle and source" do
        expect(followee).to be_valid
      end
    end

    context "invalid" do
      let (:invalid_followee) { build :followee, handle: nil, source: nil, native_id: nil }

      it "requires a handle and source" do
        expect(invalid_followee).to be_invalid
        expect(invalid_followee.errors.keys).to include(:handle, :source, :native_id)
      end
    end
  end

  describe "assocations" do
    before :each do
      @followee = Followee.create(handle: "samiam", source: "twitter")
    end

    it "responds to 'posts' method call" do
      expect(@followee).to respond_to(:posts)
    end

    it "responds to 'subscriptions' method call" do
      expect(@followee).to respond_to(:subscriptions)
    end

    it "responds to 'users' method call" do
      expect(@followee).to respond_to(:users)
    end
  end

  # describe "find_or_create_by(user)" do
  #   before :each do
  #     # params = {}
  #     # params[:source] = "instagram"

  #     @user = {
  #       "id" => "1234567890",
  #       "username" => "samiam",
  #       "profile_picture" => "sam.jpg",
  #     }
  #   end

  #   it "creates a new Followee if it does not already exist" do
  #     # params[:source] = "instagram"
  #     Followee.find_or_create_by(@user)

  #     expect(followee).to be_a Followee

  #     # expect(Followee.count).to eq 1
  #   end

  #   it "does not create a new Followee if it already exists" do
  #   end

  #   it "finds the existing Followee record if it already exists" do
  #   end
  # end
end
