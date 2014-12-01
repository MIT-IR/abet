class AddOutcomeAlignment < ActiveRecord::Migration
  def change
  	create_table "outcomes_alignment", id: false do |t|
  		t.belongs_to :outcome
  		t.belongs_to :standard_outcome
  		t.string :alignment_level
  	end
  end
end
