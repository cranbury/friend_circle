class Post < ActiveRecord::Base
  attr_accessible :author_id, :body, :title
end
