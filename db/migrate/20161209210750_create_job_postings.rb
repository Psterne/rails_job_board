class CreateJobPostings < ActiveRecord::Migration[5.0]
  def change
    create_table :job_postings do |t|
      t.text :title
      t.text :description
      t.text :email
      t.text :hiring_manager
      t.timestamps
    end
  end
end
