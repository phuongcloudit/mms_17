require "rails_helper"

RSpec.describe Team, type: :model do
  let!(:team_one) {FactoryBot.create :team}
  let!(:team_two) {FactoryBot.create :team}
  let!(:team_three) {FactoryBot.create :team}

  context "validates" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    it { is_expected.to validate_length_of(:name) }
  end

  context "ActiveRecord associations" do
    it { is_expected.to have_many :users }
  end

  context "scope order by name" do
    it "orders by ascending name" do
      expect(Team.newest).to eq([team_one, team_two, team_three])
    end
  end
end
