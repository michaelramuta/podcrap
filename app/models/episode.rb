class Episode < ApplicationRecord
  belongs_to :user

  # make sure episodes can only be CRUD by their owner/admin
end
