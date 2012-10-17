# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  photo      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artist < ActiveRecord::Base
  attr_accessible :name, :photo, :song_ids

  has_many :songs
  has_many :albums, :through => :songs

  validates :name, :photo, :presence => true
  validates :name, :uniqueness => true
end
