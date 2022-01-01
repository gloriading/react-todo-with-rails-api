class Todo < ApplicationRecord
    validates :title, presence: { message: "must be given please" }
end
