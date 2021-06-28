require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get games_url, as: :json
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post games_url, params: { game: { current_cards: @game.current_cards, deck: @game.deck, deck_offset: @game.deck_offset, end_time: @game.end_time, game_id: @game.game_id, num_of_players: @game.num_of_players, start_time: @game.start_time } }, as: :json
    end

    assert_response 201
  end

  test "should show game" do
    get game_url(@game), as: :json
    assert_response :success
  end

  test "should update game" do
    patch game_url(@game), params: { game: { current_cards: @game.current_cards, deck: @game.deck, deck_offset: @game.deck_offset, end_time: @game.end_time, game_id: @game.game_id, num_of_players: @game.num_of_players, start_time: @game.start_time } }, as: :json
    assert_response 200
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete game_url(@game), as: :json
    end

    assert_response 204
  end
end
