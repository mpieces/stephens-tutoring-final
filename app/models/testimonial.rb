class Testimonial < ActiveRecord::Base
  validates :feedback, presence: true

  # ratyrate_rateable 'overall'
  # ratyrate_rater

end
