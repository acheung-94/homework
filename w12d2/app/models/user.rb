class User < ApplicationRecord
    has_secure_password #defines #password=, #authenticate, password confirmation field. 
    before_validation :ensure_session_token
    validates :password, length: {minimum: 6}, allow_nil: true
    
    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user&.authenticate(password)
            user
        else
            nil
        end
    end

    def reset_session_token
        self.session_token = generate_session_token
        self.save!
        session_token
    end

    def ensure_session_token
        self.session_token ||= generate_session_token
    end

    private

    def generate_session_token
        loop do
            token = SecureRandom::urlsafe_base64
            return token unless User.exists?(session_token: token)
        end
    end
end
