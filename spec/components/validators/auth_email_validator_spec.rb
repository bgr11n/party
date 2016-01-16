require 'rails_helper'

RSpec.describe AuthEmailValidator do
  let(:validator) { described_class.new({ attributes: :email }) }
  subject(:validate) { validator.validate_each(record, :email, @email) }

  context "user sign in" do
    let(:identity) { create(:identity_auth) }
    let(:identity_twitch) { create(:identity_twitch) }
    let(:record) { Auth::SignIn.new({ email: @email, password: 'asd123qwezxc' }) }

    it "doesn't add error if auth email valid" do
      @email = identity.email
      validate
      expect(record.errors[:email]).not_to be_present
    end

    it "add error if auth email not valid" do
      @email = 'wrong@email.com'
      validate
      expect(record.errors[:email]).to be_present
    end

    it "add error if user logged in from Twitch" do
      @email = identity_twitch.email
      validate
      expect(record.errors[:email]).to be_present
    end
  end

  context "user sign up" do
    let(:identity) { create(:identity_auth) }
    let(:identity_twitch) { create(:identity_twitch) }
    let(:record) { Auth::SignUp.new({ email: @email, password: 'asd123qwezxc' }) }

    it "add error if email exists" do
      @email = identity.email
      validate
      expect(record.errors[:email]).to be_present
    end

    it "doesn't add error if new auth email" do
      @email = 'other@email.com'
      validate
      expect(record.errors[:email]).not_to be_present
    end

    it "add error if user logged in from Twitch" do
      @email = identity_twitch.email
      validate
      expect(record.errors[:email]).to be_present
    end
  end
end
