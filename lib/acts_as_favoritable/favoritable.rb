module ActsAsFavoritable
  module Favoritable
    module Methods
      extend ActiveSupport::Concern

      self.included do
      end

      module ClassMethods
        def is_favoritable?
          true
        end
      end # module ClassMethods

      def favoriting_by?(other)
      # self.favorites.include? other
        self.favorites.where(['favoriter_id=? AND favoriter_type=?', other.id, other.class.name]).size > 0
      end

      def favorite_by(other)
      # self.favorites << other
        self.favorites.create!(favoriter: other)
      end

      def unfavorite_by(other)
      # self.favorites.delete other
        self.favorites.where(['favoriter_id=? AND favoriter_type=?', other.id, other.class.name]).destroy_all
      end
    end # module Methods
  end # module Favoritable
end # module ActsAsFavoritable
