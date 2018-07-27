# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Gerando categorias"

categories = ["Animais e acessórios",
              "Esportes",
              "Para a sua casa",
              "Eletrônicos e celulares",
              "Música e hobbies",
              "Bebês e crianças",
              "Moda e beleza",
              "Veículos e barcos",
              "Imóveis",
              "Empregos e negócios"]

categories.each do |c|
  Category.find_or_create_by(description: c)
end

puts "Categorias geradas com sucesso"



puts "Cadastrando administrador padrão"

Admin.create!(email: "admin@admin.com", name: "Administrador geral", password: "123456", role: 0)

puts "Administrador cadastrado com sucesso"
