class MmorpgNews::GameNews
  attr_accessor :title, :author, :link, :description, :date


  def self.scrape_stories
    Nokogiri::HTML(open("http://massivelyop.com/"))
  end

  def self.get_story(link)
    doc = Nokogiri::HTML(open(link)).css(".entry")
    doc.children.each { |c| c.remove if c.name == 'div'}
    doc.text.strip
  end

  def self.create_stories
    stories = []
    scrape_stories.css("section#content article").each do |article|
      story = self.new
      story.title = article.css("h2").text
      story.author = article.css(".fn").text
      story.date = article.css("time").text,
      story.link = article.css("h2.post-title a").attribute('href').value
      stories << story
    end
    stories
  end

end
