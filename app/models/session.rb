class Session < ApplicationRecord
  validates :exam_name, length: {minimum: Settings.min_3,
    too_long: "You must enter more than 3 characters, for example: kỳ x"}
  validates :exam_name,:period_for,:supervisor, presence: true
  validates :supervisor, length: {minimum: Settings.min_3,
    too_long: "You must enter more than 3 characters, for example: name you"}
end
