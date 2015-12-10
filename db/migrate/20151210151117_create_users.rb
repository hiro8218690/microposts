class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps null: false
      
      t.index :email, unique: true # ユニークインデックスを追加して、メールアドレスが他と異なるようにしています
      
    end
  end
end
