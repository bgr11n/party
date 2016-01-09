require 'rails_helper'

RSpec.describe Auth::SignUp, type: :model do
  context 'notify if' do
    # it 'no email or/and password provided' do
    it 'no email' do
      auth = Auth::SignUp.new(email: '', password: 'password')
      expect(auth.save).to eq(false)
      expect(auth.errors[:email].size).to eq(1)
    end
    it 'no password' do
      auth = Auth::SignUp.new(email: 'bgr11n@gmail.com', password: '')
      expect(auth.save).to eq(false)
      expect(auth.errors[:password].size).to eq(1)
    end
  end
end
