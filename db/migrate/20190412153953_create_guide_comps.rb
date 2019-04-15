class CreateGuideComps < ActiveRecord::Migration[5.2]
  def change
    create_table :guide_comps do |t|
      t.string :guide_comp_name

      t.timestamps
    end
  end
end
