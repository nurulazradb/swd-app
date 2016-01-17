require "rails_helper"

RSpec.describe ShortenersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/shorteners").to route_to("shorteners#index")
    end

    it "routes to #new" do
      expect(:get => "/shorteners/new").to route_to("shorteners#new")
    end

    it "routes to #show" do
      expect(:get => "/shorteners/1").to route_to("shorteners#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shorteners/1/edit").to route_to("shorteners#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shorteners").to route_to("shorteners#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/shorteners/1").to route_to("shorteners#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/shorteners/1").to route_to("shorteners#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shorteners/1").to route_to("shorteners#destroy", :id => "1")
    end

  end
end
