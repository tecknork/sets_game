# frozen_string_literal: true
require 'securerandom'
require 'date'

module GameManager
    class GameCreator < ApplicationService
       
          
          def call 
            
            card_list = Array(0...80).shuffle
            current_cards = card_list.first(12)
            @game = Game.new(game_id: SecureRandom.uuid,deck: card_list,start_time: DateTime.now,end_time:DateTime.now,
              deck_offset: 12,num_of_players:1,current_cards:card_list.first(12))
            
            @game
          end 
          

    end
  end