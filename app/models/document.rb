require 'sizes'
class Document < ActiveRecord::Base
  belongs_to :collection
  scope :orphans, -> { where(collection_id: nil) }
  
  has_many :annotations, -> { order('y, x, created_at') }
  
  has_and_belongs_to_many :tags

  include Sizes
  has_attached_file :attachment, :styles => { :medium => [size_for_width(300), :png], :thumb => [size_for_width(100), :png] }, :default_url => "/images/:style/missing.png"

  validates_attachment :attachment, :presence => true, :content_type => { :content_type => "application/pdf" }

  def title
    self[:title] || attachment_file_name
  end
  
  def executive_summary
    first = annotations.first
    
    annotations.where(x: first.x, y: first.y)
               .order('created_at')
               .map(&:content)
               .join("\n\n")
  end

end
