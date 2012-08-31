class Character < ActiveRecord::Base
	belongs_to :script
	has_many :lines, dependent: :destroy

  attr_accessible :name, :script_id

  validates_presence_of :name
  validates_presence_of :script_id
end
