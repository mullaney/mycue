require 'spec_helper'

describe ApplicationHelper do 
	it "should include the page title" do
		full_title("foo").should =~ /foo/
	end
	it "should include the base title" do
		full_title("foo").should =~ /myCue/
	end
	it "should not include a bar when blank" do
		full_title("").should_not =~ /\|/
	end
end