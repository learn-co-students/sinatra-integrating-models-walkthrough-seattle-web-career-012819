class TextAnalyzer
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def count_of_words
    @text.split(" ").count
  end

  def count_of_vowels
    text.scan(/[aeoui]/).count
  end

  def count_of_consonants
    text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
  end

  def most_used_letter
    letters_only = text.gsub(/[^a-z]/, "")
    letters_as_array = letters_only.split("")
    letters = letters_as_array.uniq
    counts = {}

    letters.map {|c| counts[c] = letters_as_array.count(c)}

    counts.max_by {|k,v| v}
  end

end