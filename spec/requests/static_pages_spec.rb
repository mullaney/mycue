require 'spec_helper'

describe "Static Pages" do
  subject { page }

  describe "home page (root)" do
    before { visit root_path }

    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector('title', text: "| Home") }
    it { should have_selector('h1', text: "myCue") }
    it { should have_selector('h2', text: "Learn your lines with myCue!") }
    
  end

  describe "help page" do
    before { visit help_path }

  	it { should have_selector('title', text: full_title('Help')) }
  	it { should have_selector('h1', text: "Help") }
  end
end
