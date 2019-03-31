class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize (id:, name:, type:, db:, hp:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);)", name, type)
  end

  def self.find(id, db)
    #find pokemon by id
    #return a new pokemon object
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
    Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], db: db)
    #initialize a new pokemon and we are setting the attributes which have been defined as keywords the value found_pokemon[0] is the data we returned in the array after we did a search in our databse.
  end

def alter_hp(new_hp, db)
  db.execute("UPDATE pokemon SET hp = ? WHERE id  = ?;", new_hp, self.id) #how will you get the id? because we are dealing with the instance of the pokemon and it will recognize each instance self.id and return the id of that instance.
  #what is the keyword if we want to change data in our database in a column UPDATE
end

end
