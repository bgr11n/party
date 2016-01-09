require 'rails_helper'

RSpec.describe Auth::SignIn, type: :model do
  context 'user from plain try to sign in' do
    let(:identity) { create(:identity_auth) }

    it { expect(Auth::SignIn.new(email: identity.email, password: 'correct_password').save).to eq(true) }

    it 'does not allow to log in with wrong email' do
      log_data = { email: 'dont_exist@email.com', password: 'wrong_password' }
      sign_in = Auth::SignIn.new(log_data)

      expect(sign_in.save).to eq(false)
      expect(sign_in.errors[:email].size).to eq(1)
    end

    it 'does not allow to log in with wrong password' do
      log_data = { email: identity.email, password: 'wrong_password' }
      sign_in = Auth::SignIn.new(log_data)

      expect(sign_in.save).to eq(false)
      expect(sign_in.errors[:password].size).to eq(1)
    end

    it 'does not allow to log in with empty password' do
      log_data = { email: identity.email, password: '' }
      sign_in = Auth::SignIn.new(log_data)

      expect(sign_in.save).to eq(false)
      expect(sign_in.errors[:password].size).to eq(1)
    end
  end

  context 'user from not plain source try to sign in' do
    it 'notify if user logged in from twitch and try log in from plain' do
      identity_twitch = create(:identity_twitch)
      log_data = { email: identity_twitch.email, password: 'wrong_password' }
      sign_in = Auth::SignIn.new(log_data)

      expect(sign_in.save).to eq(false)
      expect(sign_in.errors[:email].size).to eq(1)
    end
  end
end
