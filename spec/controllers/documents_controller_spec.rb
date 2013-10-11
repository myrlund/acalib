require 'spec_helper'

describe DocumentsController do

  describe :index do
    it "should return all available documents" do
      documents = FactoryGirl.create_list(:document, 3)
      get :index, format: :json
      assigns[:documents].should == documents
    end
  end

  describe :show do
    it "should return the requested document" do
      document = FactoryGirl.create(:document)
      get :show, id: document.id, format: :json
      assigns[:document].should == document
    end
  end

  describe :create do
    it "should create a document" do
      tag = create(:tag)
      
      document = {
        attachment: fixture_file_upload('report.pdf', 'application/pdf'),
        tag_ids: [tag.id]
      }
      post :create, document: document, format: :json
      assigns[:document].id.should_not be_nil
      assigns[:document].tag_ids.count.should == 1
    end
  end

  describe :update do
    it "should update document" do
      document = FactoryGirl.create(:document)
      document.title = "Schnauzer"
      patch :update, id: document.id, document: document.serializable_hash, format: :json
      assigns[:document].id.should == document.id
      assigns[:document].title.should == "Schnauzer"
    end
  end

  describe :destroy do
    it "should delete the document" do
      document = FactoryGirl.create(:document)
      delete :destroy, id: document.id, format: :json
      assigns[:document].persisted?.should be_false
    end
  end

end
