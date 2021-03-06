require 'spec_helper'

describe "Authentication" do

	subject { page }

	describe "login page" do
		before { visit login_path }

		it { should have_selector('h1', text: 'Login') }
		it { should have_selector('title', text: 'Login') }
	end

	describe "login" do
		before { visit login_path }

		describe "with invalid information" do
			before { click_button "Login" }

			it { should have_selector('title', text: 'Login') }
			it { should have_selector('div.alert.alert-error', text: 'Invalid') }

			describe "after visiting another page" do
				before { click_link "myCue" }
				it { should_not have_selector('div.alert-error') }
			end
		end

		describe "with valid information" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email", with: user.email
				fill_in "Password", with: user.password
				click_button "Login"
			end

			it { should have_selector('title', text: "Profile") }
			it { should have_link('Profile', href: user_path(user)) }
			it { should have_link('Logout', href: logout_path) }
			it { should_not have_link('Login', href: login_path) }

			describe "followed by logout" do
				before { click_link "Logout" }
				it { should have_link('Login') }
			end
		end
	end

	describe "authorization" do
		
		describe "for non-signed-in users" do
			let(:user) { FactoryGirl.create(:user) }

			describe "in the Users controller" do

				describe "visiting the profile page" do
					before { visit user_path(user) }
					it { should have_selector('title', text: 'Login') }
				end
			end

			describe "in the Scripts controller" do
				describe "submitting the create action" do
					before { post scripts_path }
					specify { response.should redirect_to(login_path) }
				end

				describe "sumbitting the destroy action" do
					before { delete script_path(FactoryGirl.create(:script)) }
					specify { response.should redirect_to(login_path) }
				end
			end
		end
	end
end
