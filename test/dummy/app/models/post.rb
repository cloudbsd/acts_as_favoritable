class Post < ActiveRecord::Base
  acts_as_favoritable_by :favoriting_users
end
