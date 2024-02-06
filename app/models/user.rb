class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, AvatarUploader

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :tasks, dependent: :nullify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is_admin?
    self.admin
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[first_name last_name email created_at updated_at address admin]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[tasks]
  end
end
