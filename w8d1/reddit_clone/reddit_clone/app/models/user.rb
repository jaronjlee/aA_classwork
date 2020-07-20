# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string
#  session_token   :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
#AASPIRE

class User < ApplicationRecord

    validates :username, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}

    attr_reader :password
    after_initialize :ensure_session_token

    has_many :subs,
        foreign_key: :moderator_id,
        class_name: :Sub

    has_many :posts,
        foreign_key: :author_id,
        class_name: :Post
        

    def self.find_by_credentials(username, password)
        @user = User.find_by(username: username)
        if @user && @user.check_password(password)
            return @user
        else
            return nil
        end
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def check_password(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64
    end
    
end
