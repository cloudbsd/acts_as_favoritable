require 'active_support'
require 'active_model'
require 'active_record'

require "acts_as_favoritable/version"
require "acts_as_favoritable/favorite"
require "acts_as_favoritable/favoriter"
require "acts_as_favoritable/favoritable"

module ActsAsFavoritable
  extend ActiveSupport::Concern

  included do
  end

  module ClassMethods
    def acts_as_favoritable(options={})
      do_acts_as_favoritable(options)
    end

    def acts_as_favoritable_by(name, options={})
      do_acts_as_favoritable(options)
      if name.present?
        has_many name, {through: :favorites, source: :favoriter, source_type: (/favoriting_(.+)/.match(name))[1].singularize.camelize}.merge(options)
      end
    end

    def acts_as_favoriter(options={})
      do_acts_as_favoriter(options)
    end

    def acts_as_favoriter_on(name, options={})
      do_acts_as_favoriter(options)
      if name.present?
        has_many name, {through: :favorites, source: :favoritable, source_type: (/favorited_(.+)/.match(name))[1].singularize.camelize}.merge(options)
      end
    end

    def do_acts_as_favoritable(options={})
      unless self.is_favoritable?
        has_many :favorites, {:as => :favoritable, :dependent => :destroy}.merge(options)
        include ActsAsFavoritable::Favoritable::Methods
      end
    end

    def do_acts_as_favoriter(options={})
      unless self.is_favoriter?
        has_many :favorites, {:as => :favoriter, :dependent => :destroy}.merge(options)
        include ActsAsFavoritable::Favoriter::Methods
      end
    end

    def is_favoritable?
      false
    end

    def is_favoriter?
      false
    end
  end # ClassMethods
end # ActsAsFavoritable


ActiveRecord::Base.send :include, ActsAsFavoritable
