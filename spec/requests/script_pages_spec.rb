require 'spec_helper'

describe 'Script pages' do
	
	subject { page }
	let(:user) { FactoryGirl.create(:user) }
	
	before do
    visit login_path
    fill_in "Email",        with: user.email
    fill_in "Password",     with: "foobar"
    click_button "Login"
  end

	describe "script creation" do

		describe "with invalid information" do

			it "should not create a script" do
				expect { click_button "Create new script" }.not_to change(Script, :count)
			end

			describe "error messages" do
				before { click_button "Create new script" }
				it { should have_content('error') }
			end
		end

		describe "with valid information" do

			before { fill_in 'script_title', with: "Lorem ipsum" }
			it "should create a script" do
				expect { click_button "Create new script" }.to change(Script, :count).by(1)
			end
		end
	end
end