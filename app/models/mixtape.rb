# == Schema Information
#
# Table name: mixtapes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Mixtape < ActiveRecord::Base
  attr_accessible :name, :song_ids

  has_and_belongs_to_many :songs
  has_and_belongs_to_many :users

end
