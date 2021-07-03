# frozen_string_literal: true
require 'securerandom'
require 'date'

module GameManager
    class GameCreator < ApplicationService
       
      attr_reader :id
          
      def initialize(id)
          if id 
            @id = id 
          else 
            @id = SecureRandom.uuid
          end 
      end
      
      def call 
            
            card_list = Array(0...80).shuffle
            @game = Game.new(game_id: id,deck: card_list,start_time: DateTime.now,end_time:DateTime.now,
              deck_offset: 12,num_of_players:1,current_cards:card_list.first(12))
            
            @game
      end 
          

    end
  end