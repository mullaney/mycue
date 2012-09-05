require 'spec_helper'

describe "User Pages" do
	subject { page }

  describe "profile page not logged in" do
  	let(:user) { FactoryGirl.create(:user) }
  	before { visit user_path(user) }

  	it { should have_selector('h1', text: "Login") }
    it { should have_selector('div.alert.alert-notice', text: 'Please sign in first.') }
  	it { should have_selector('title', text: "Login") }
  end

  describe "looking at someone else's profile" do
    let(:u1) { FactoryGirl.create(:user) }
    let(:u2) { FactoryGirl.create(:user) }

    before do
      visit login_path
      fill_in "Email",        with: u1.email
      fill_in "Password",     with: "foobar"
      click_button "Login"
      visit user_path(u2)
    end

    it { should have_selector('h1', text: "Profile") }
    it { should have_selector('div.alert.alert-notice', text: 'You do not have permission to see other profiles.') }
    it { should have_content("#{u1.email}") }
    it { should_not have_content("#{u2.email}") }
  end

  describe "looking at your own profile" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:script1) { FactoryGirl.create(:script, user: user, title: "First") }
    let!(:script2) { FactoryGirl.create(:script, user: user, title: "Second") }

    before do
      visit login_path
      fill_in "Email",        with: user.email
      fill_in "Password",     with: "foobar"
      click_button "Login"
    end

    it { should have_selector('h1', text: "Profile") }
    it { should have_content("#{user.email}") }
    it { should have_selector('h3', text: "Your scripts") }
    it { should have_selector('input', value: 'Create new script') }

    describe "scripts" do
      it { should have_content(script1.title) }
      it { should have_content(script2.title) }
    end
  end

  describe "sign up" do
    before { visit signup_path }
    let(:submit) { "Create my account" }

    it { should have_selector('h1', text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }

    describe "with invalid information" do
      it { should have_link('Login') }
      it { should_not have_link('Logout') }
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Email",        with: "test@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit}
        let(:user) { User.find_by_email('user@example.com') }

        it { should have_selector('title', text: "Profile") }
        it { should have_selector('div.alert.alert-success', text: 'Thanks for joining myCue!') }
        it { should have_link('Logout') }
        it { should_not have_link('Login') }
      end
    end
  end
end
