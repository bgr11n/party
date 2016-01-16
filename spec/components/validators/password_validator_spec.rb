require 'rails_helper'

RSpec.describe PasswordValidator do
  let(:validator) { described_class.new({ attributes: :password }) }
  subject(:validate) { validator.validate_each(record, :password, @password) }

  context "password required" do
    let(:record) { Auth::SignUp.new(email: 'valid@email.com', password: @password) }

    it "doesn't add an error when password is good" do
      @password = "weron235alsfn234"
      validate
      expect(record.errors[:password]).not_to be_present
    end

    it "add an error when password is blank" do
      @password = ""
      validate
      expect(record.errors[:password]).to be_present
    end

    it "adds an error when password is too short" do
      @password = "p"
      validate
      expect(record.errors[:password]).to be_present
    end

    it "adds an error when password is the same as the email" do
      @password = "pork@chops.com"
      record.email = @password
      validate
      expect(record.errors[:password]).to be_present
    end
  end

  context "password not required" do
  end
end
