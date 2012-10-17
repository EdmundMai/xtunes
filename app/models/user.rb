# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  balance         :decimal(, )
#

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :balance

  has_and_belongs_to_many :songs
  validates :balance, :presence => true, :numericality => true

  has_secure_password
end
