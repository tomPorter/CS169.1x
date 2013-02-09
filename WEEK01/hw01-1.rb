#!/usr/bin/env ruby
def palindrome?(word)
    lc = ('a'..'z')
    temp_word = word.downcase.each_char.select {|l| lc.include? l}.join
    return temp_word == temp_word.reverse
end

def count_words(string)
    lc = ' abcdefghijklmnopqrstuvwxyz'
    temp_string = string.downcase.each_char.select {|l| lc.include? l}.join
    words = temp_string.split
    dict = Hash.new(0)
    words.each {|w| dict[w] += 1 }
    return dict
end
