class Client < ActiveRecord::Base
  has_many :tasks
  attr_accessible :name, :keyword, :task_ids

end
