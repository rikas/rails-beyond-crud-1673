class Review < ApplicationRecord
  belongs_to :restaurant # because we have restaurant_id FK
end
