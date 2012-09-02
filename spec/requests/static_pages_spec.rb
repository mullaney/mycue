require 'spec_helper'

describe "Static Pages" do
	let (:base_title) { "myCue" }
  describe "home page" do

    it "should have 'Home' in the title" do
    	visit static_pages_home_path
    	page.should have_selector('title', text: "#{base_title} | Home")
    end

    it "should be the root path" do
    	visit root_path
    	page.should have_selector('title', text: "#{base_title} | Home")
    end

    it "should have 'myCue' in h1" do
    	visit static_pages_home_path
    	page.should have_selector('h1', text: "myCue")
    end

    it "should have subtitle in content" do 
    	visit static_pages_home_path
    	page.should have_content('Learn your lines with myCue')
    end
  end

  describe "help page" do

  	it "should have 'Help' in the title" do
  		visit static_pages_help_path
  		page.should have_selector('title', text: "#{base_title} | Help")
  	end

  	it "should be have /about as it's path" do
  		visit '/help'
  		page.should have_selector('title', text: "#{base_title} | Help")
  	end

  	it "should have 'Help' in the h1 header" do
  	  visit help_path
  	  page.should have_selector('h1', text: "Help")
  	end
  end
end
