class Task < ApplicationRecord

  # enum state: ['Novy', 'V reseni', 'Ceka se na klienta', 'Vyreseno']
  enum state: %w[state_new state_in_progress state_waiting state_completed]

  belongs_to :user
  belongs_to :project

  # serialize :files, Array, coder: JSON
  has_many :file_attachments, dependent: :destroy
  accepts_nested_attributes_for :file_attachments, allow_destroy: true
  # mount_uploader :files, TasksFileUploader
  validates :name, presence: true
  validates :project_id, presence: true
  validates :user_id, presence: true
  validates :state, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[name description created_at state updated_at]
  end

  def self.titles
    %w[Name Description Solver State]
  end
end
