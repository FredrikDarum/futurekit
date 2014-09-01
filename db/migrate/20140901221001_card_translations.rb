class CardTranslations < ActiveRecord::Migration
  def self.up
    Card.create_translation_table!({
      :name => :string,
      :short_desc => :string,
      :long_decs => :text
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Card.drop_translation_table! :migrate_data => true
  end
end
end
