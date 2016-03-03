class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Testimonial"
  belongs_to :rateable, :polymorphic => true
end
