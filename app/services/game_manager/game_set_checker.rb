# frozen_string_literal: true


module GameManager
    class GameSetChecker < ApplicationService
       

        attr_reader :game_id, :card_list
          
        def initialize(game_id,card_list)
            
            @game_id = game_id
            @card_list = card_list

        end
        
        def call 
            #puts @game_id
            #uts @card_list
            @game = find_game(@game_id)
            puts @game.current_cards.length
            
            if (@card_list -  @game.current_cards).empty?
                    cards = get_three_cards(@card_list)
                    is_set = check_set(cards)
                    puts is_set
                    return is_set
            end
            
            raise Error::GameError,I18n.t(:cards_not_in_list)
            
        end

        private

        def get_three_cards(card_list)
            puts card_list
            @cards = Card.where(id: card_list)
            return @cards if @cards.length == 3 
            raise Error::GameError,I18n.t(:cards_not_found_in_db)
        end
    
        def find_game(game_id)
            puts game_id
            @game = Game.find_by(game_id: game_id)
            return @game if @game
            raise Error::GameError,I18n.t(:game_id_not_found)
        end 
    
        def check_set(cards)
            #puts cards 
           # puts cards.map{ |card| Card.colors[card.color] }
            color = (cards.map{|card| Card.colors[card.color]}.sum % 3).zero?
            shape = (cards.map{|card| Card.shapes[card.shape]}.sum % 3).zero?
            fill = (cards.map{|card| Card.fillings[card.filling]}.sum % 3).zero?
            number = (cards.map(&:number).sum % 3).zero?
                
            return true if number && color && fill && shape
            false  
        end 
      
    end
end