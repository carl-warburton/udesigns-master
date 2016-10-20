class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]

  before_create :set_default_role
  has_one :profile
  belongs_to :role

  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.provider = auth.provider
     user.uid = auth.uid
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
   end
 end


   # or
   # before_validation :set_default_role

   private
   def set_default_role
     self.role = Role.find(1)
   end


end
