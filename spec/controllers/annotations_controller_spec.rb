require 'spec_helper'

describe AnnotationsController do

  describe :index do
    it "should return all available annotations" do
      document = create(:document)
      annotations = FactoryGirl.create_list(:annotation, 3, document: document)
      get :index, document_id: document.id, format: :json
      assigns[:annotations].should == annotations
    end
  end

  describe :show do
    it "should return the requested annotation" do
      annotation = FactoryGirl.create(:annotation)
      get :show, id: annotation.id, format: :json
      assigns[:annotation].should == annotation
    end
  end

  describe :create do
    it "should create a annotation" do
      document = create(:document)
      annotation = FactoryGirl.build(:annotation, document: document)
      post :create, document_id: document.id, annotation: annotation.serializable_hash, format: :json
      assigns[:annotation].content.should == annotation.content
      assigns[:annotation].id.should_not be_nil
    end
  end

  describe :update do
    it "should update annotation" do
      annotation = FactoryGirl.create(:annotation)
      annotation.content = "Schnauzer"
      patch :update, id: annotation.id, annotation: annotation.serializable_hash, format: :json
      assigns[:annotation].id.should == annotation.id
      assigns[:annotation].content.should == "Schnauzer"
    end
  end

  describe :destroy do
    it "should delete the annotation" do
      annotation = FactoryGirl.create(:annotation)
      delete :destroy, id: annotation.id, format: :json
      assigns[:annotation].persisted?.should be_false
    end
  end

end
