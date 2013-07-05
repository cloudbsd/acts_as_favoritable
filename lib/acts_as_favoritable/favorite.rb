#module ActsAsFavoritable
  class Favorite < ActiveRecord::Base
    belongs_to :favoritable, :polymorphic => true
    belongs_to :favoriter, :polymorphic => true

#   attr_accessible :favoritable_id, :favoritable_type,
#                   :favoriter_id, :favoriter_type,
#                   :favoritable, :favoriter

    validates :favoritable_id, presence: true
    validates :favoritable_type, presence: true
    validates :favoriter_id, presence: true
    validates :favoriter_type, presence: true
  end
#end
