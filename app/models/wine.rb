# == Schema Information
#
# Table name: wines
#
#  id                 :integer          not null, primary key
#  name               :string
#  varietal           :string
#  price              :string
#  location_of_origin :string
#  year_of_origin     :integer
#  image              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Wine < ApplicationRecord
    
has_many :favorites, :dependent => :destroy
has_many :reviews, :class_name => "Rating", :dependent => :destroy
has_many :varietals, :dependent => :nullify

has_many :fans, :through => :favorites, :source => :user
    
end
