# frozen_string_literal: true


module GameManager
    class GameAllSetChecker < ApplicationService
       

        attr_reader :game_id
          
        def initialize(game_id)
            
            @game_id = game_id
        

        end
        
        def call 
            #puts @game_id
            #uts @card_list
            @game = find_game(@game_id)
            
            list_permutations = @game.current_cards.permutation(3).to_a
           # puts list_permutations.size

            list_permutations = list_permutations.map(&:sort).uniq
           # puts list_permutations.size

            current_possible_sets = []
            list_permutations.each do  |card_list| 
                current_possible_sets.push(card_list) if check_set(get_three_cards(card_list))
            end 
            current_possible_sets
                        
        end

        private

        def get_three_cards(card_list)
            #puts card_list
            @cards = Card.where(id: card_list)
            return @cards if @cards.length == 3 
            raise Error::GameError,I18n.t(:cards_not_found_in_db)
        end
    
        def find_game(game_id)
            #puts game_id
            @game = Game.find_by(game_id: game_id)
            return @game if @game
            raise Error::GameError,I18n.t(:game_id_not_found)
        end 
    
        def check_set(cards)
            color = (cards.map{|card| Card.colors[card.color]}.sum % 3).zero?
            shape = (cards.map{|card| Card.shapes[card.shape]}.sum % 3).zero?
            fill = (cards.map{|card| Card.fillings[card.filling]}.sum % 3).zero?
            number = (cards.map(&:number).sum % 3).zero?
                
            return true if number && color && fill && shape
            false  
        end 
      
    end
end