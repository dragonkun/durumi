xml.instruct! :xml, :version=>"1.0" 
xml.rss(:version=>"2.0"){
  xml.channel{
    xml.title("Title")
    xml.link("http://www.yoursite.com/")
    xml.description("Lifestream")
    xml.language('en-us')
      for i in @items
        xml.item do
#         xml.title(i.title)
#         xml.description(i.html_content)      
#         xml.author("Your Name Here")               
#         xml.pubDate(i.created_on.strftime("%a, %d %b %Y %H:%M:%S %z"))
#         xml.link(i.link)
#					xml.guid(i.link)
        end
      end
  }
}
