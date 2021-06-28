# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.7.3

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Database 

 cards 
  - card_id : int  
  - color : int 
  - shape : int 
  - filling : int 
  - number : int 
  - bit_id : string
  - card_name :string

 game 
  - game_id : :uuid
  - num_of_players: int 
  - start_time: datetime 
  - end_time: datetime 
  <!-- - score :int 
  - hints : int  -->
  - deck: int array:true 
  - deck_offset : int  ( array_id )
  - current_cards_visible: int array:true

set 
  - game_id : uuid 
  - player_id: uuid 
  - cards : int array:true 