class FriendCircle < ActiveRecord::Base
  attr_accessible :name, :owner_id, :friend_ids

  validates :name, presence: true

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id
    )

  has_many(
    :memberships,
    class_name: "FriendCircleMembership",
    foreign_key: :friend_circle_id,
    primary_key: :id
    )

    has_many :friends, through: :memberships, source: :user

    has_many :post_circles
    has_many :posts, through: :post_circles
end
