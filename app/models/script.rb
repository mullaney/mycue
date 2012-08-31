class Script < ActiveRecord::Base
	has_many :scenes, dependent: :destroy
	has_many :characters, dependent: :destroy
	has_many :lines, through: :scene

  attr_accessible :title

  validates_presence_of :title
end
