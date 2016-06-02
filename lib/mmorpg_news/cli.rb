class MmorpgNews::CLI
  @story_items = []
  def call
  list_stories
  menu
  end

  def list_stories
    puts "MMORPG's top news stories:"
    @story_items = MmorpgNews::GameNews.scrape_stories
    @story_items.each.with_index(1) do |story, i|
      puts "#{i}. #{story.title}"
      puts "Posted #{story.date.first} by #{story.author}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the news story you like more info on or type list to see them again or type exit:"
      input = gets.strip.downcase
      if input.to_i > 0
        the_story = @story_items[input.to_i-1]
        puts "#{the_story.title}"
        puts "Posted #{the_story.date} by #{the_story.author}"
        puts "#{the_story.description}"
        puts "#{the_story.link}"
      elsif input == "list"
          list_stories
      elsif input == "exit"
          goodbye
      else
        puts "invalid entry!"
      end
    end
  end

  def goodbye
    puts "Thank you for using MMORPG's news Gem!"
  end


end
