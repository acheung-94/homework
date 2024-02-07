require 'sqlite3'
require 'singleton' #ensure only one instance of database connection in code

class CatDBConnection < SQLite3::Database 
    include Singleton
    def initialize
        super('cats.db')
        self.type_translation = true #data returned is same type as input type
        self.results_as_hash = true #tables come back in a hash, instead of an array. default is array
    end

end

class Cat
    attr_accessor :name, :age, :breed, :color, :id

    def self.all #print all records
        data = CatDBConnection.instance.execute("SELECT * FROM cats") #grabs connection from SQLITE, executes SQL code, then saves to a variable
        data.map {|datum| Cat.new(datum)} #all the columns 
    end

    def initialize(options) #create a new instance of Cat with an options HASH. 
       
        @name = options['name']
        @age = options['age']
        @color = options['color']
        @breed = options['breed']
        @id = options['id'] #if user calls .new, they will not pass in an 'id' and @id will be nil
    end

    def create
        #can't add an item if it already exists
        raise "#{self} is already in database" if @id #is a truthy value v are bind arguments that sanitize (put an escape symbol) the input.
        CatDBConnection.instance.execute(<<-SQL, @name, @age, @color, @breed, @id)
            INSERT INTO
                cats (name, age, color, breed, id)
            VALUES
                (?, ?, ?, ?, ?) 
        SQL
        #sql injection attacks
        @id = CatDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} does not exist in database" unless @id #"unless id is a truthy value"
        CatDBConnection.instance.execute(<<-SQL, @name, @age, @color, @breed, @id)
            UPDATE 
                cats
            SET
                name = ?, age =  ?, color = ?, breed = ?
            WHERE
                id = ?
        SQL
    end
end