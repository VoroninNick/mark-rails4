class Contact < ActiveRecord::Base
  attr_accessible *attribute_names

  # def self.columns() @columns ||= []; end
  #
  # def self.column(name, sql_type = nil, default = nil, null = true)
  #   columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  # end
  #
  # column :name, :string
  # column :company, :string
  # column :role, :string
  # column :phone, :string
  # column :email, :string
  # column :question, :text

  validates_presence_of :name, :company, :role, :email, :question, :message => "не може бути пустим"

  def self.self_create_table
    ActiveRecord::Base.connection.create_table("contacts"){|t|
      t.string :city
      t.string :fax
      t.string :name
      t.string :company
      t.string :role
      t.string :phone
      t.string :email
      t.text :question
    }
  end

end