require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:carts) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should allow_value('user@example.com').for(:email) }
  it { should_not allow_value('invalid_email').for(:email) }

  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(Devise.password_length.min) }
end
