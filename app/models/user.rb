class User < ApplicationRecord
  # Direct associations

  has_many   :follower_requests,
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :received_follower_requests,
             :class_name => "FollowerRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  has_many   :uploads,
             :class_name => "Photo",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
