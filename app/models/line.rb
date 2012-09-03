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

class Line < ActiveRecord::Base
	belongs_to :scene

  attr_accessible :cue, :line, :order, :scene_id

  validates_presence_of :cue
  validates_presence_of :line
  validates_presence_of :order
  validates_presence_of :scene_id

  def first_letter
  	self.line
  end
end
