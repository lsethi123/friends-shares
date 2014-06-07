class EvnetsShare < ActiveRecord::Base
  belongs_to :event
  belongs_to :friend
  attr_accessible :share,:event_id,:friend_id
end
