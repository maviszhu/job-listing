class FavouriteJob < ApplicationRecord
  belongs_to :user
  belongs_to :job
end
