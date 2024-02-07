require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_title(title)
    data = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT 
         *
      FROM
        plays
      WHERE
        title = ?
    SQL
    data.map {|row| row['title']}
  end

  def self.find_by_playwright(playwright)
    hash = PlayDBConnection.instance.execute(<<-SQL, playwright)
      SELECT
        title
      FROM
        plays
      WHERE plays.playwright_id = (
          SELECT
            id
            FROM
            playwrights
          WHERE
            name = ?
        )
    SQL
    hash.map {|row| row['title'] }
  end #ok, now find a better way to query for playwright id given playwright name
end

class PlayWright 
  attr_accessor :id, :birth_year, :name
  
  def self.find_by_name(name) #needs to return an instance
    PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT 
          *
      FROM
        playwrights
      WHERE
        name = ?
    SQL
  end

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| PlayWright.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
      INSERT INTO
        playwrights (name, birth_year, id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?, id = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays #plays is a hash.. or an array?
    
    data = PlayDBConnection.instance.execute(<<-SQL, self.id)
    SELECT
      plays.title
    FROM
      plays
    JOIN
      playwrights ON plays.playwright_id = playwrights.id
    WHERE
      playwrights.id = ?
    SQL
    data.map {|row| row['title']}
  end

end