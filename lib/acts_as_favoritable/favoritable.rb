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
        self.favorites.where(favoriter: other).size > 0
      end

      def favorite_by(other)
        self.favorites.create(favoriter: other)
      end

      def unfavorite_by(other)
        self.favorites.where(favoriter: other).destroy_all
      end
    end # module Methods
  end # module Favoritable
end # module ActsAsFavoritable
