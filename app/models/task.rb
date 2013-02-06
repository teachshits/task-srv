class Task < ActiveRecord::Base
  belongs_to :client
  attr_accessible :content, :status, :result, :client_id

  include AASM

  aasm_column :status
  aasm do
    state :created, :initial => true
    state :started
    state :completed

    event :start do
      transitions :from => :created, :to => :started
    end

    event :complete do
      transitions :from => :started, :to => :completed
    end
  end

  rails_admin do

    show do
      configure :result do
        visible true
      end
    end

    edit do
      configure :status do
        visible false
      end
      configure :result do
        visible false
      end
    end

    configure :client do
    end
  end

end
