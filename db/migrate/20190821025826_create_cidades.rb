class CreateCidades < ActiveRecord::Migration[5.2]
  def change
    create_table :cidades do |t|
      t.string :nome
      t.references :estado, foreign_key: true

      t.timestamps
    end
  end

  def data
  	Cidade.reset_column_information

  	rio_de_janeiro = Estado.where(nome: "Rio de Janeiro").first
  	minas_gerais = Estado.where(nome: "Minas Gerais").first
  	sao_paulo = Estado.where(nome: "São Paulo").first

  	Cidade.create!(nome: "Rio de Janeiro", estado: rio_de_janeiro)
  	Cidade.create!(nome: "Minas Gerais", estado: minas_gerais)
  	Cidade.create!(nome: "Guarulhos", estado: sao_paulo)
  end
end
