module Sizes
  extend ActiveSupport::Concern
  
  module ClassMethods
    def size_for_width(width)
      "#{width}x#{(300 * Math.sqrt(2)).round}>"
    end
  end
end