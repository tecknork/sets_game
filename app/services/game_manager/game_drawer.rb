# frozen_string_literal: true
require 'securerandom'
require 'date'

module GameManager
    class GameDrawer < ApplicationService
        attr_reader :draw_next,:id,:max_cards
          
        def initialize(id,draw_cards,max_cards)
            puts id 
            puts draw_cards
            @id = id
            @draw_next = draw_cards
           
        end
        
        def call 
            @game = Game.find_by(game_id: @id)
            puts @game.current_cards.length
            if @game
                if @game.current_cards.length < max_cards
                    next_card_list = @game.deck.drop(@game.deck_offset).first(@draw_next)
                    @game.deck_offset += @draw_next 
                    @game.current_cards.push(*next_card_list)
                    return @game
                 end
                #raise Error::GameError,I18n.t(:draw_card_error)
                @game
            end 
                raise Error::GameError,I18n.t(:game_id_not_found)
        end
    end
end