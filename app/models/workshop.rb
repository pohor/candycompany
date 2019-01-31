class Workshop < ApplicationRecord
  validates :name, presence: true, length: 3..50
  validates :description, presence: true, length: 3..2000
  validates :place, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :time_start, presence: true
  validates :end_time, presence: true

  mount_uploader :workshop_cover, WorkshopCoverUploader
end
