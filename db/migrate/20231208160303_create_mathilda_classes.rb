class CreateMathildaClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :mathilda_classes do |t|
      t.string :name

      t.timestamps
    end
  end
end
