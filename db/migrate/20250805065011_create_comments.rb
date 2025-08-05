class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|

      ## comments追加テーブル
      t.string :content, null: false, default: ""
      t.references :prototype, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
