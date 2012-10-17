# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  photo      :string(255)
#

class Album < ActiveRecord::Base
  attr_accessible :name, :photo, :song_ids

  has_many :songs
  has_many :artists, :through => :songs

  validates :name, :photo, :presence => true
  validates :name, :uniqueness => true
end
