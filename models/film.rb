require_relative("../db/sql_runner")
require_relative("./customer")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}', '#{@price}') RETURNING id"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def delete()
  sql = "DELETE FROM films WHERE id = #{@id}"
  SqlRunner.run(sql)
  end

  def update()
  sql = "
  UPDATE films SET (
    title,
    price
  ) = (
    '#{@title}',
    #{@price} )
  WHERE id = #{@id}"
  SqlRunner.run(sql)
  end

  def customers
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets ON tickets.customer_id = customers.id
    WHERE film_id = #{@id}"
    results = SqlRunner.run(sql)
    results.map {|customer| Customer.new(customer)}

  end




end
