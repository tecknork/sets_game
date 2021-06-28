# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
card_id = 0
0.upto(2).each do |color|
  0.upto(2).each do |shape|
    0.upto(2).each do |filling|
      0.upto(2).each do |number|
        bit_id = '%02b' % color + '%02b' % shape + '%02b' % filling + '%02b' % number
        card_name = "#{card_id}.svg"
        Card.create(card_id: card_id, color: color, shape: shape, filling: filling, number: number, bit_id: bit_id,
                    card_name: card_name)
        card_id += 1
      end
    end
  end
end
