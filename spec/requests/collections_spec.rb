require 'spec_helper'

describe "Collections" do
  describe "GET /collections.json" do
    it "renders a valid JSON response" do
      get collections_path(format: :json)
      response.status.should be(200)
      response.content_type.should eq("application/json")
    end
  end
end
