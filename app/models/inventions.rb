class Inventions < ActiveRecord::Base
    belongs_to :user

    validates :title, :description, :relevant_field, presence: true
end