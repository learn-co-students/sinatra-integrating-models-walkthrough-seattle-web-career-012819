require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]
    @length = text_from_user.split(" ").length
    @v_count = text_from_user.downcase.scan(/[aeoui]/).count
    @c_count = text_from_user.downcase.scan(/[bcdfghjklmnpqrstvwxyz]/).count

    letter_hash = Hash.new{0}
    i = 0
    while i < text_from_user.length
      char = text_from_user[i]&.upcase
      letter_hash[char] += 1
      i += 1
    end
    @letter = letter_hash.key(letter_hash.values.max)
    @letter_count = letter_hash[@letter]
    erb :results
  end
end
