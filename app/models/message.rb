class Message < ActiveRecord::Base
  validates_presence_of :department, :subject, :email, :body
  validates_length_of :body, minimum: 15
  validates_length_of :subject, minimum: 5
  DEPARTMENTS = [ ["Booking <booking@samraines.com>", "booking@samraines.com"],
                  ["Press <press@samraines.com>", "press@samraines.com"],
                  ["Sam <sam@samraines.com>", "sam@samraines.com"]
                ]
end
