require_relative("../db/sql_runner")
require_relative("./film")

class Customer
  attr_reader :id
  attr_accessor :name

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO customers (name) VALUES ('#{@name}') RETURNING id"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update()
    sql = "
    UPDATE films SET (
      name
    ) = (
      '#{@name}' )
    WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets on tickets.film_id = films.id
    WHERE customer_id = #{@id}"
    results = SqlRunner.run(sql)
    results.map {|film| Film.new(film)}
  end


end
