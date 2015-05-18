# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer          not null
#  commentable_type :string           not null
#  body             :string           not null
#  user_id          :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  validates :body, :commentable_id, :commentable_type, :user_id, presence: true
  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: 'User', foreign_key: :user_id, primary_key: :id
end
