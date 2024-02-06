class Project < ApplicationRecord
    has_many :tasks, dependent: :restrict_with_error

    validates :name, presence: true

    def self.ransackable_attributes(auth_object = nil)
        %w[name description created_at updated_at]
    end

    def self.ransackable_associations(auth_object = nil)
        %w[tasks]
    end

end
