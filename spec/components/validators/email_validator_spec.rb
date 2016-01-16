require 'rails_helper'

RSpec.describe EmailValidator do
  def blocks? email
    record = Auth::SignUp.new({ email: email, password: '1qwe123Pk}]' })
    validator = EmailValidator.new(attributes: :email)
    validator.validate_each(record, :email, record.email)
    record.errors[:email].present?
  end

  it "add error when email is blank" do
    expect(blocks?('')).to eq(true)
  end

  it "add error when email is not valid" do
    expect(blocks?('notvalid@email')).to eq(true)
  end

  it "doesn't add error when email is valid" do
    expect(blocks?('valid@email.com')).to eq(false)
  end
end
