class MmorpgNews::CLI
  @story_items = []
  def call
  list_stories
  menu
  end

  def list_stories
    puts "\e[H\e[2J"
    puts "MMORPG's top news stories:"
    puts ""
    @story_items = MmorpgNews::GameNews.create_stories
    @story_items.each.with_index(1) do |story, i|
      puts "#{i}. #{story.title}"
      puts "Posted #{story.date.first} by #{story.author}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "\nEnter the number of the news story you would like to read:"
      puts "Type 'list' to see the article list again or 'exit' to exit:"
      input = gets.strip.downcase
      if input.to_i > 0 && @story_items[input.to_i-1] != nil
        the_story = @story_items[input.to_i-1]
        puts "\e[H\e[2J"
        puts "#{the_story.title}"
        puts "Posted #{the_story.date.first} by #{the_story.author}"
        puts "\n#{MmorpgNews::GameNews.get_story(the_story.link)}"
        puts "\n#{the_story.link}"
      elsif input == "list"
          list_stories
      elsif input == "exit"
        puts "\e[H\e[2J"
        goodbye
      else
        puts "invalid entry!"
      end
    end
  end

  def goodbye
    puts "Thank you for using MMORPG news Gem!"
  end


end
