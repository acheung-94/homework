require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create!(email: 'lilly_llama@hello.com', password: 'password') }

  it 'should validate the presence of email' do
    should validate_presence_of(:email)
  end

  it 'should validate the presence of password_digest' do
    should validate_presence_of(:password_digest)
  end

  it 'should validate that the password is more than 6 characters in length' do
    should validate_length_of(:password).is_at_least(6)
  end

  describe 'finds users by credentials' do
    context 'with a valid email and password' do
      it 'returns the proper user' do
        sally = User.create(email: 'sally_lee', password: 'password')
        user = User.find_by_credentials('sally_lee', 'password')

        expect(sally.email).to eq(user.email)
        expect(sally.password_digest).to eq(user.password_digest)
      end
    end
    context 'with an invalid email and password' do
      it 'returns nil' do
        jack = User.create(email: 'jack_bruce@jack.com', password: 'abcdef')
        user = User.find_by_credentials('jack_bruce@jack.com', 'notthepassword')
        expect(user).to be_nil
      end
    end
  end

  describe 'reset_session_token' do
    it 'should generate a new session token and save it to the database' do
      old_session_token = subject.session_token
      new_session_token = subject.reset_session_token!
      expect(old_session_token).not_to eq(new_session_token)
    end
  end

  describe 'is_password?' do
    it 'should return a boolean whether the incoming password, when hashed/salted matches password_digest' do
      expect(subject.is_password?('hello')).to be(false)
      expect(subject.is_password?('password')).to be(true)
    end

  end

end
