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

  def self.find_by_title(title)
    data = PlayDBConnection.instance.execute(<<-SQL, title)
    SELECT
      *
    FROM
      Plays
    WHERE
      title = ?
    SQL

    return nil unless title.length > 0
  end

  def self.find_by_playwright(name)
    data = PlayDBConnection.instance.execute(<<-SQL, name)
    SELECT
      *
    FROM
      Plays
    WHERE
      playwright_id = ?
    SQL
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

  class Playwright 
    attr_accessor :name, :id, :birth_year
    def self.all
      data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
      data.map { |datum| Playwright.new(datum) }
    end

    def self.find_by_name(name)
      raise "#{self} is already existed" unless @name
      data = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwright
      WHERE
        name = ?
      SQL
      return nil if !person.length > 0

    end

    def new(options)
      @id = options['id']
      @name = options['name']
      @birth_year = options['birth_year']

    end

    def create
      raise "#{self} is already in database" unless self.id
      PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
        INSERT INTO 
        Playwright (id, name, birth_year)
        VALUES
        (?, ?)
      SQL
      self.id = PlayDBConnection.instance.last_insert_row_id

    end

    def update
      raise "#{self} not in database" unless self.id
      PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)
        SELECT
          name, birth_year
        VALUES
          name = ?, birth_year = ?
        WHERE
          id = ?
      SQL

    end

    def get_plays
      raise "#{self} is not in database" unless self.id
      PlayDBConnection.instance.execute(<<-SQL, self.id)
      SELECT 
        *
      FROM
        Play
      WHERE
        playwright_id = ?
      SQL
    end
  end

end
