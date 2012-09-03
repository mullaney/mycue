require 'spec_helper'

describe "Static Pages" do
	let (:base_title) { "myCue" }
  describe "home page (root)" do

    it "should only have base title" do
    	visit root_path
    	page.should have_selector('title', text: "#{base_title}")
    end

    it "should not have 'Home' in the root path" do
    	visit root_path
    	page.should_not have_selector('title', text: "| Home")
    end

    it "should have 'myCue' in h1" do
    	visit root_path
    	page.should have_selector('h1', text: "myCue")
    end

    it "should have subtitle in h2" do 
    	visit root_path
    	page.should have_selector('h2', text: "Learn your lines with myCue!")
    end
    
  end

  describe "help page" do

  	it "should have 'Help' in the title" do
  		visit help_path
  		page.should have_selector('title', text: "#{base_title} | Help")
  	end

  	it "should be have /about as it's path" do
  		visit help_path
  		page.should have_selector('title', text: "#{base_title} | Help")
  	end

  	it "should have 'Help' in the h1 header" do
  	  visit help_path
  	  page.should have_selector('h1', text: "Help")
  	end
  end
end
