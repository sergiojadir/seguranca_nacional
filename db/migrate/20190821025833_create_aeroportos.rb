class CreateAeroportos < ActiveRecord::Migration[5.2]
  def change
    create_table :aeroportos do |t|
      t.string :nome
      t.string :codigo
      t.string :apelido
      t.references :cidade, foreign_key: true

      t.timestamps
    end
  end

  def data
  	Aeroporto.reset_column_information

  	rio = Cidade.where(nome: "Rio de Janeiro").first
		bh = Cidade.where(nome: "Minas Gerais").first
		guarulhos =Cidade.where(nome: "Guarulhos").first

  	[
  		{ nome: "Santos Dumont Airport", codigo: "SDU", apelido: "Santos Dumont", cidade: rio },
  		{ nome: "Tancredo Neves International Airport", codigo: "CNF", apelido: "Confins", cidade: bh },
  		{ nome: "Guarulhos International Airport", codigo: "GRU", apelido: "Guarulhos", cidade: guarulhos }
  	].each do |aeroporto|
  		Aeroporto.create!(
  			nome: aeroporto[:nome], codigo: aeroporto[:codigo],
  			apelido: aeroporto[:apelido], cidade: aeroporto[:cidade]
  		)
  	end
  end
end
