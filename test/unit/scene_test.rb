# == Schema Information
#
# Table name: scenes
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  script_id  :integer          not null
#  order      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SceneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
