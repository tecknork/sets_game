# frozen_string_literal: true
require 'date'

module GameManager
    class GameUpdateSet < ApplicationService
       

        attr_reader :game_id, :card_list
          
        def initialize(game_id,card_list)
            
            @game_id = game_id
            @card_list = card_list

        end
        
        def call 
            @game = find_game(@game_id)
            update_set(@game,card_list)
            update_game(@game,card_list)
            
            
        end

        private

    
        def find_game(game_id)
            #puts game_id
            @game = Game.find_by(game_id: game_id)
            return @game if @game
            raise Error::GameError,I18n.t(:game_id_not_found)
        end 
    
      
    
        def update_game(game,card_list)
            modify_current_list = game.current_cards.difference(card_list)
            game.current_cards = modify_current_list
            if game.save
                true 
            else 
                raise Error::GameError,I18n.t(:game_not_updated)
            end
        end

        def update_set(game,card_list)
            puts game
            puts card_list 
            set = GameSet.new(game_id: game.id, cards: card_list,created_time: DateTime.now)
            if set.save
                true 
            else  
                puts set.errors
                raise Error::GameError,I18n.t(:set_not_updated)   
            end
        end

      
    end
end