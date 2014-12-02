class AddOutcomeAlignments < ActiveRecord::Migration
  def change
  	create_table "outcome_alignments", id: false do |t|
  		t.belongs_to :outcome
  		t.belongs_to :standard_outcome
  		t.string :alignment_level
  	end
  end
end
