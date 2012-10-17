# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  photo      :string(255)
#  file       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer
#  album_id   :integer
#  cost       :decimal(, )
#  like       :integer          default(0)
#

class Song < ActiveRecord::Base
  attr_accessible :file, :name, :photo, :artist_id, :album_id, :genre_ids, :cost, :remote_photo_url

  belongs_to :artist
  belongs_to :album

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :mixtapes

  validates :file, :name, :photo, :presence => true
  validates :file, :name, :uniqueness => true
  validates :cost, :presence => true, :numericality => true

  mount_uploader :photo, PikUploader
end
