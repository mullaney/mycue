class Scene < ActiveRecord::Base
	has_many :lines, dependent: :destroy
	belongs_to :scene

  attr_accessible :name, :order, :script_id

  validates_presence_of :name
  validates_presence_of :order
  validates_presence_of :script_id
end
