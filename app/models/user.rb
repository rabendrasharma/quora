class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :questions
  has_many :answers
  has_many :user_topics
  has_many :subscribed_topics, :through => :user_topics, source: :topic
end
