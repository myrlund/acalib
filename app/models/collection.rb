class Collection < ActiveRecord::Base
  has_many :documents, -> { order('position') }
end
