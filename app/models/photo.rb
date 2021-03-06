class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :likes,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  has_many   :users,
             :through => :likes,
             :source => :user

  # Validations

end
