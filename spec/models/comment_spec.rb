require 'rails_helper'

RSpec.describe Comment, type: :model do
  context "associations" do
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :post}
  end

  describe "validations" do
    it {expect validate_presence_of :content}
    it {expect validate_presence_of :post}
    it do
      expect validate_numericality_of(:post).only_integer
    end
    it {expect validate_presence_of :user}
    it do
      expect validate_numericality_of(:user).only_integer
    end
  end
end
