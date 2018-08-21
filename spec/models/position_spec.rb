require "rails_helper"

RSpec.describe Position, type: :model do

  context "validates" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:short_name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    it { is_expected.to validate_uniqueness_of(:short_name).case_insensitive }
    it { is_expected.to validate_length_of(:name) }
    it { is_expected.to validate_length_of(:short_name) }
  end
end
