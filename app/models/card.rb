# == Schema Information
#
# Table name: cards
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  short_desc  :string(255)
#  long_desc   :text
#  category    :string(255)
#  readiness   :decimal(, )
#  photo       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  approved    :boolean
#  category_id :integer
#  slug        :string(255)
#

class Card < ActiveRecord::Base
	extend FriendlyId

	friendly_id :name, use: :slugged
	acts_as_taggable
	acts_as_follower
  	acts_as_followable

	mount_uploader :photo, PhotoUploader
	validates :name, presence: true
	validates :short_desc, presence: true

	has_paper_trail

	has_many :links, :dependent => :destroy

	#translates :name, :short_desc, :long_desc

	has_many :categories
	accepts_nested_attributes_for :categories


def self.search(query)
	puts "searching..."
  	where("name like ?", "%#{query}%" ) 
end

end
