class User < ActiveRecord::Base
  acts_as_favoriter
  acts_as_favoriter_on :favorited_posts
  acts_as_favoriter_on :favorited_articles

# has_many :favorited_posts, through: :favorites, class_name: 'Favorite', foreign_key: 'favoriter_id', source: :favoritable, source_type: 'Post'
# has_many :favorited_posts, through: :favorites, source: :favoritable, source_type: 'Post'
end
