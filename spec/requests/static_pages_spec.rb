require 'spec_helper'

describe "StaticPages" do
  describe "GET /" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get "/"
      expect(response.status).to be(200)
      expect(response.body).to include('Register')
    end
  end
end
