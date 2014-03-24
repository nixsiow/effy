# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  description :string(255)
#  user_id     :integer
#  completed   :boolean
#  category    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Task < ActiveRecord::Base
    attr_accessible :description, :user_id, :completed, :category
    belongs_to :user
end
