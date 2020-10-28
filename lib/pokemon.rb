class Pokemon

  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (type, name)
      VALUES (?, ?)
    SQL

    db.execute(sql, type, name)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
    SQL
    matched_pokemon = db.execute(sql, id)[0]
    Pokemon.new(id: matched_pokemon[0], name: matched_pokemon[1], type: matched_pokemon[2], db: db)
  end

end
