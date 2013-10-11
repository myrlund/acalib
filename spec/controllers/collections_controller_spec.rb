require 'spec_helper'

describe CollectionsController do

  describe :index do
    it "should return all available collections" do
      collections = FactoryGirl.create_list(:collection, 3)
      get :index, format: :json
      assigns[:collections].should == collections
    end
  end

  describe :show do
    it "should return the requested collection" do
      collection = FactoryGirl.create(:collection)
      get :show, id: collection.id, format: :json
      assigns[:collection].should == collection
    end
  end

  describe :create do
    it "should create a collection" do
      collection = FactoryGirl.build(:collection)
      post :create, collection: collection.serializable_hash, format: :json
      assigns[:collection].title.should == collection.title
      assigns[:collection].id.should_not be_nil
    end
  end

  describe :update do
    it "should update collection" do
      collection = FactoryGirl.create(:collection)
      collection.title = "Schnauzer"
      patch :update, id: collection.id, collection: collection.serializable_hash, format: :json
      assigns[:collection].id.should == collection.id
      assigns[:collection].title.should == "Schnauzer"
    end
  end

  describe :destroy do
    it "should delete the collection" do
      collection = FactoryGirl.create(:collection)
      delete :destroy, id: collection.id, format: :json
      assigns[:collection].persisted?.should be_false
    end
  end

end
