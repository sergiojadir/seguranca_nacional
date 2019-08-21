class CreateEstados < ActiveRecord::Migration[5.2]
  def change
    create_table :estados do |t|
      t.string :nome
      t.string :codigo

      t.timestamps
    end
  end

  def data
  	Estado.reset_column_information

  	[
  		{ nome: "Rio de Janeiro", codigo: "RJ" },
  		{ nome: "Minas Gerais", codigo: "MG" },
  		{ nome: "São Paulo", codigo: "SP" }
  	].each do |estado|
  		Estado.create!(nome: estado[:nome], codigo: estado[:codigo])
  	end
  end
end
