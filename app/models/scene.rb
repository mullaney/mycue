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

class Scene < ActiveRecord::Base
	has_many :lines, dependent: :destroy
	belongs_to :scene

  attr_accessible :name, :order, :script_id

  validates_presence_of :name
  validates_presence_of :order
  validates_presence_of :script_id
end
