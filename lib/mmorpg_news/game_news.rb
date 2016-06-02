class MmorpgNews::GameNews
  attr_accessor :title, :author, :link, :description, :date

  # def self.all

  # end

  def self.scrape_stories
    stories = []
    doc = Nokogiri::HTML(open("http://massivelyop.com/"))
    # binding.pry


    doc.css("section#content article").each do |article|
      story = self.new
      story.title = article.css("h2").text
      story.author = article.css(".fn").text
      story.date = (article.css("time").text),
      story.link = article.css("h2.post-title a").attribute('href').value
      story.description = article.css("p").text
      stories << story
      # stories << {title: title, author: author, date: date, link: link, description: description}
      # binding.pry
    end
    # binding.pry
    stories
  end
end
