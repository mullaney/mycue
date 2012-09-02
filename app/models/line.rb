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
