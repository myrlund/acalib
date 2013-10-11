require 'spec_helper'

describe Document do
  describe :orphans do
    it "should return only documents without a collection" do
      c = FactoryGirl.create(:collection)
      FactoryGirl.create_list(:document, 2, collection: c)
      orphan = create(:document, collection: nil)
      
      Document.orphans.count.should == 1
      Document.orphans.should == [orphan]
    end
  end
  
  describe :attachment do
    it "should upload and post-process correctly" do
      document = Document.create(attachment: fixture_file_upload('report.pdf', 'application/pdf'))
      document.title.should == "report.pdf"
    end
  end
  
  describe :tags do
    it "should work" do
      document = create(:document)
      tag = create(:tag)
      
      document.tags.count.should == 0
      document.tags << tag
      document.tags.count.should == 1
      document.tags.first.should == tag
      
      document.tags.delete(tag)
      document.tags.count.should == 0
    end
  end
  
  describe :annotations do
    it "should be ordered by y, then x" do
      document = create(:document)
      
      3.times do |n|
        create(:annotation, document: document, x: n, y: 0)
      end
      3.times do |n|
        create(:annotation, document: document, x: 0, y: n)
      end
      
      document.annotations.first.x.should == 0
      document.annotations.first.y.should == 0

      document.annotations.last.x.should == 0
      document.annotations.last.y.should == 2
    end
  end
  
  describe :executive_summary do
    it "should be a chronological concatenation of the first annotations" do
      document = create(:document)
      
      3.times do |n|
        create(:annotation, document: document, x: 0, y: 0, created_at: n.hours.ago, content: "Foo #{n}")
      end
      
      create(:annotation, document: document, x: 0, y: 10, content: "NO")
      create(:annotation, document: document, x: 10, y: 0, content: "NO")
      
      create(:annotation, document: document, x: 0, y: 0, created_at: 10.days.ago, content: "FIRST")
      
      document.executive_summary.should ==  "FIRST\n\nFoo 2\n\nFoo 1\n\nFoo 0"
    end
  end
end
