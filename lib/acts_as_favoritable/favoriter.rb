module ActsAsFavoritable
  module Favoriter
    module Methods
      extend ActiveSupport::Concern

      self.included do
      end

      module ClassMethods
        def is_favoriter?
          true
        end
      end # module ClassMethods

      def favoriting?(other)
      # self.favorites.include? other
        self.favorites.where(['favoritable_id=? AND favoritable_type=?', other.id, other.class.name]).size > 0
      end

      def favorite(other)
      # self.favorites << other
        self.favorites.create!(favoritable: other)
      end

      def unfavorite(other)
      # self.favorites.delete other
        self.favorites.where(['favoritable_id=? AND favoritable_type=?', other.id, other.class.name]).destroy_all
      end

    # def favorites_by_type(type_name)
    #   favoritables = []
    #   self.favorites.where(['favoritable_type=?', type_name]).includes(:favoritable).each do |item|
    #     favoritables << item.favoritable
    #   end
    #   favoritables
    # # type_name.classify.constantize.joins items
    # end

    # def method_missing(m, *args)
    #   if m.to_s[/favorited_(.+)/]
    #     type_name = $1.singularize.camelize
    #     favorites_by_type type_name
    #   else
    #     super
    #   end
    # end
    end # module Methods
  end # module Favoriter
end # module ActsAsFavoritable
