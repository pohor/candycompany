class Workshop < ApplicationRecord
  mount_uploader :workshop_cover, WorkshopCoverUploader
end
