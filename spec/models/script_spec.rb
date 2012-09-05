# == Schema Information
#
# Table name: scripts
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Script do

	let(:user) { FactoryGirl.create(:user) }

	before do 
		@script = user.scripts.build(title: "Lorem ipsum")
	end

	subject { @script }

	it { should respond_to(:title) }
	it { should respond_to(:user_id) }
	its(:user) { should == user }

	it { should be_valid }

	describe "accessible attributes" do
		it "should not allow access to user_id" do
			expect do
				Script.new(user_id: user.id)
			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
		end
	end

	describe "when user_id is not present" do
    before { @script.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank title" do
    before { @script.title = " " }
    it { should_not be_valid }
  end

  describe "with title that is too long" do
    before { @script.title = "a" * 51 }
    it { should_not be_valid }
  end
end
