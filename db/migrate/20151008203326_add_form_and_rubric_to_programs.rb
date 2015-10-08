class AddFormAndRubricToPrograms < ActiveRecord::Migration
  
  def self.up
    add_attachment :programs, :application_form
    add_attachment :programs, :rubric
  end


end
