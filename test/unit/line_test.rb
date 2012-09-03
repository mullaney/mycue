# == Schema Information
#
# Table name: lines
#
#  id         :integer          not null, primary key
#  scene_id   :integer          not null
#  cue        :string(255)      not null
#  line       :string(255)      not null
#  order      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class LineTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
