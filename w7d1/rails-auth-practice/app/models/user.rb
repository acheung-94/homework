class User < ApplicationRecord
    attr_reader :password
    
    validates :username, :session_token, presence:true
    validates :password_digest, presence: {message: "Password can't be blank"}
    validates :password, length: {minimum: 6, allow_nil: true}
    before_validation :ensure_session_token

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
        
    end
    
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end
    
    def is_password?(password)
        # inc_pass = Bcrypt::Password.new(password).is_password?(password)
        BCrypt::Password.new(password_digest).is_password?(password)
        #re-encrypting? 'testing123' >>
    end
    
    private
    def ensure_session_token
        self.session_token ||= generate_unique_session_token
    end

    def generate_unique_session_token
        loop do
            session_token = SecureRandom::urlsafe_base64(16)
            return session_token unless User.exists?(session_token: session_token)
        end
    end

    def reset_session_token!
        self.session_token = generate_unique_session_token
        self.save!
        self.session_token
    end
end
