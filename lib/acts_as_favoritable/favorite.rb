#module ActsAsFavoritable
  class Favorite < ActiveRecord::Base
    belongs_to :favoritable, :polymorphic => true
    belongs_to :favoriter, :polymorphic => true

    validates :favoritable, presence: true
    validates :favoriter, presence: true
  end
#end
