# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  about           :text
#  image           :text
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
    attr_accessible :name, :about, :image, :password, :password_confirmation
    has_many :tasks

    has_secure_password
    validates :image, :presence => true
    validates :name, :presence => true, :length => { :minimum => 2 }
    validates :name, :uniqueness => true
end
