# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  profile_pic            :string
#  bio                    :string
#  taste_profile          :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  
has_many :favorites, :dependent => :destroy
has_many :reviews, :class_name => "Rating", :dependent => :destroy
has_many :sent_clinks, :class_name => "Clink", :foreign_key => "sender_id", :dependent => :destroy
has_many :received_clinks, :class_name => "Clink", :foreign_key => "recipient_id", :dependent => :destroy

has_many :favorite_wines, :through => :favorites, :source => :wine
has_many :followers, :through => :received_clinks, :source => :sender
has_many :clinks, :through => :sent_clinks, :source => :recipient
has_many :reviews_by_clinks, :through => :clinks, :source => :reviews
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
