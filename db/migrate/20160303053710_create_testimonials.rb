class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :feedback
      t.string :name

      t.timestamps null: false
    end
  end
end
