# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


# self.find_by_credentials
# password=/password
# is_password?
# reset_session_token!
# ensure_session_token


class User < ApplicationRecord

    after_initialize :ensure_session_token
    validates :email, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def password=(password) #password = 1234
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def password
        @password
    end
    
    def check_password?(password) #1234 678a9sdf978asdf79adsf79
        password_obj =  BCrypt::Password.new(self.password_digest)
        password_obj.is_password?(password)
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        if user && user.check_password?(password)
            user
        else
            nil
        end   
    end


end
