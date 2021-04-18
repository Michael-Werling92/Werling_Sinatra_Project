class Inventions < ActiveRecord::Base
    belongs_to :user

    validates :title, :description, :relevant_field, :date_of_conception, :patent_filed, presence: true
end