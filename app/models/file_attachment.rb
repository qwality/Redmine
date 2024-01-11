class FileAttachment < ApplicationRecord
  mount_uploader :file , TasksFileUploader
  belongs_to :task
end
