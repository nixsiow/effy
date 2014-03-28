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
#  email           :string(255)
#  location        :string(255)
#

class User < ActiveRecord::Base
    attr_accessible :name, :about, :image, :password, :password_confirmation, :email, :location
    has_many :tasks

    has_secure_password
    # validates :name, :presence => true, length: { minimum: 6, maximum: 20 }, :uniqueness => { case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]+\Z/, message: "only allows alphanumeric characters" }
    # validates :password, :presence => true, length: { minimum: 6, maximum: 20 }, format: { with: /\A[a-zA-Z0-9]+\Z/, message: "only allows alphanumeric characters" }
    validates :image, :presence => true
    validates :name, :presence => true, :length => { :minimum => 2 }
    validates :name, :uniqueness => true
end
