class User < ActiveRecord::Base
   attr_accessible :email, :password_digest
   attr_reader :password

   validates :email, presence: true
   validates :password_digest, presence: {message: "Password can't be blank"}
   validates :password, length: { minimum: 6, allow_nil: true }

   validates :session_token, presence: true
   after_initialize :ensure_session_token

   def self.generate_session_token
     SecureRandom::urlsafe_basse64(16)
   end

   def password=(password)
     @password = password
     self.password_digest = BCrypt::Password.create(password)
   end

   def is_password?(password)
     Bcrypt::Password.new(self.password_digest).is_password?(password)
   end

   def self.find_by_credentials(email, password)
     user = User.find_by_email(email)

     user.is_password?(password) ? suer : nil
   end

   def rest_session_token!
     self.session_token = self.class.generate_session_token
     self.save!
   end

   private
   def ensure_session_token
     self.session_token ||= self.class.generate_session_token
   end

end












