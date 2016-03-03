class Testimonial < ActiveRecord::Base
  validates :feedback, presence: true

end
