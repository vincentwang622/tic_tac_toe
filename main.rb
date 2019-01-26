require_relative 'game_class.rb'
require_relative 'player_class.rb'

def main
    game = Game.new
    game.draw_board

    until game.check_end_game
        game.draw_legend
        game.player_move
        game.draw_board
        game.check_end_game
        game.switch_player
    end 
end

main()