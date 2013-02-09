#!/usr/bin/env ruby
class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

def rps_game_winner(game)
    raise WrongNumberOfPlayersError unless game.length == 2
    game.each { |n,s| raise NoSuchStrategyError unless ['R','S','P'].include? s.upcase }
    first,second = game
    fp = first[1].upcase
    sp = second[1].upcase
    if fp == sp
        return first
    end
    if fp == 'R' and sp == 'S'
        return first
    end
    if sp == 'R' and fp == 'S'
        return second
    end
    if fp == 'S' and sp == 'P'
        return first
    end
    if sp == 'S' and fp == 'P'
        return second
    end
    if fp == 'P' and sp == 'R'
        return first
    end
    if sp == 'P' and fp == 'R'
        return second
    end

end

def rps_tournament_winner(tournament) 
    separate_plays = []
    tournament.flatten.each_slice(2) {|p| separate_plays << p }
    pairs = []
    separate_plays.each_slice(2) {|pair| pairs << pair }
    while pairs.size > 1
        winners = pairs.collect {|g| rps_game_winner(g) }
        pairs = []
        winners.each_slice(2) {|pair| pairs << pair }
    end
    return rps_game_winner(pairs[0])
end
