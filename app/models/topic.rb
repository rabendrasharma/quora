class Topic < ApplicationRecord
  has_many :user_topics
  has_many :subscribers, :through => :user_topics, source: :topic
  has_many :question_topics
  has_many :questions, :through => :question_topics, source: :topic
  has_many :answers, :through => :questions, source: :answer
end
