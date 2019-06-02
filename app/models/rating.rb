# == Schema Information
#
# Table name: ratings
#
#  id         :integer          not null, primary key
#  wine_id    :integer
#  user_id    :integer
#  score      :float
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rating < ApplicationRecord
    
belongs_to :wine
belongs_to :user

end
