# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  body       :string           not null
#  completed  :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Goal < ActiveRecord::Base
  include Commentable
  validates :user_id, :body, presence: true
  validates :body, length: { minimum: 1, maximum: 255 }
  belongs_to :user
  has_many :cheers

end
