class Session < ActiveRecord::Base
   attr_accessible :user_id, :session_token

   validates :user_id, :session_token, presence: :true
   validates :session_token, uniqueness: :true

   belongs_to(
   :user,
   class_name: 'User',
   foreign_key: :user_id,
   primary_key: :id
   )


end