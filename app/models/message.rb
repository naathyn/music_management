class Message < ActiveRecord::Base
  validates_presence_of :subject, :email, :body
  validates_length_of :body, minimum: 15
  validates_length_of :subject, minimum: 5
end
