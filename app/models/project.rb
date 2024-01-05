class Project < ApplicationRecord
    has_many :tasks, dependent: :restrict_with_error
    
    before_destroy :ensure_not_referenced_by_any_task

    validates :name, presence: true

end
