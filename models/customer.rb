require_relative("../db/sql_runner")
require_relative("./film")

class Customer
  attr_reader :id
  attr_accessor :name

  def initialize( options )
    @id = options['options'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO customers (name) VALUES ('#{@name}') RETURNING id"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end
end
