require "rails_helper"

RSpec.describe Team, type: :model do

  context "validates" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    it { is_expected.to validate_length_of(:name) }
  end

  context "ActiveRecord associations" do
    it "check a association with user" do
      is_expected.to have_many :users
    end
  end

  describe "default scope" do
    let!(:team_one) { Team.create(name: "ATeam 01") }
    let!(:team_two) { Team.create(name: "ZTeam 02") }

    it "orders by ascending name" do
      expect(Team.newest).to eq([team_one, team_two])
    end
  end
end
