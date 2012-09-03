# == Schema Information
#
# Table name: scripts
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Script < ActiveRecord::Base
	has_many :scenes, dependent: :destroy
	has_many :lines, through: :scene

  attr_accessible :title

  validates_presence_of :title
end
