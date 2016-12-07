class LineAnalyzer
  
  attr_reader :highest_wf_count, :highest_wf_words, :content, :line_number

  def initialize (content, line_number)
    @content = content
    @line_number = line_number
    calculate_word_frequency(content)
  end

  def calculate_word_frequency(content)
    word_frequency = Hash.new(0)
    @highest_wf_count = Hash.new(0)
    @highest_wf_words = Hash.new(0)

    content.split.each do |word|
      word_frequency[word.downcase] += 1
    end

    @highest_wf_count = word_frequency.values.max
    @highest_wf_words = word_frequency.select { |key, value| value === @highest_wf_count }.keys
  end
end


class Solution

  attr_reader :analyzers, :highest_count_across_lines, :highest_count_words_across_lines
  
  def initialize()
    @analyzers = []
  end

  def analyze_file()
    proc_lines = File.open('test.txt')
    proc_lines.each { |line, index| @analyzers << LineAnalyzer.new(line, index) }
  end

  def calculate_line_with_highest_frequency()
    @highest_count_across_lines = 0
    @highest_count_words_across_lines = []
    @analyzers.each do |line| 
      if line.highest_wf_count > @highest_count_across_lines
        @highest_count_across_lines = line.highest_wf_count
      end
    end
    @analyzers.select do |line|
      if line.highest_wf_count == @highest_count_across_lines
        @highest_count_words_across_lines << line
      end
    end
  end

  def print_highest_word_frequency_across_lines()
    @highest_count_words_across_lines.each { |pr_result|
      puts "#{pr_result.highest_wf_words} in line #{pr_result.line_number}" }
  end
end
