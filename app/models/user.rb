class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :hearts
  has_many :hearted_posts, through: :hearts, source: :post

  mount_uploader :avatar, AvatarUploader

  def admin?
    admin
  end

  def fullname
    firstname + ' ' + lastname
  end


end
