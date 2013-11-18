class User < ActiveRecord::Base
  attr_accessible :email, :password_digest

  validates :email, :password_digest, presence: true
  validates :email, :password_digest, uniqueness: true

  has_many(
    :cats,
    class_name: "Cat",
    foreign_key: :user_id,
    primary_key: :id)

    has_many(
    :sessions,
    class_name: 'Session',
    foreign_key: :user_id,
    primary_key: :id)

    has_many(
      :posts,
      class_name: 'Post',
      foreign_key: :author_id,
      primary_key: :id
      )

    has_many(
      :owned_circles,
      class_name: 'Circle',
      foreign_key: :user_id,
      primary_key: :id
    )

    has_many(
      :memberships,
      class_name: 'FriendCircleMembership',
      foreign_key: :user_id,
      primary_key: :id
      )

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(email, password)
    user = User.where("email = ?", email).first
    return user if user.is_password?(password)
    nil
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token
    self.session_token = self.class.generate_session_token
  end

  def send_password_reset
    self.password_reset_token = self.class.generate_session_token
    self.save!
    UserMailer.password_reset(self).deliver
  end

end