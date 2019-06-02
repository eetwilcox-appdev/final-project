# == Schema Information
#
# Table name: varietals
#
#  id         :integer          not null, primary key
#  grape      :string
#  wine_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Varietal < ApplicationRecord

belongs_to :wine, :required => false

end
