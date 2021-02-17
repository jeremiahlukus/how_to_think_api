class CreateAudio < ActiveRecord::Migration[6.0]
  def change
    create_table :audios do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :experation_date
      t.string :audio_url
      t.string :title
      t.text :description
      t.string :artwork
    end
  end
end
