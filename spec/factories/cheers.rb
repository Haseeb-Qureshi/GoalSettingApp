# == Schema Information
#
# Table name: cheers
#
#  id         :integer          not null, primary key
#  goal_id    :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :cheer do
    goal nil
user nil
  end

end
