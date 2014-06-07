class Event < ActiveRecord::Base
  attr_accessible :location, :name, :total,:created_at
end
