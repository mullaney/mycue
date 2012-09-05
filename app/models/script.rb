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
	belongs_to :user

  attr_accessible :title

  validates :title, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true

  default_scope order: 'scripts.created_at ASC'
end
