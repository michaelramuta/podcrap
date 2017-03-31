xml.instruct!
xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd", "version" => "2.0" do
  xml.channel do 
    xml.title @user.title
    xml.link @user.website
    xml.language 'en-us'
    xml.copyright @user.copyright
    xml.tag!('itunes:subtitle', @user.subtitle)
    xml.tag!('itunes:author', @user.username)
    xml.tag!('itunes:summary', @user.summary)
    xml.description @user.description
    xml.tag!('itunes:owner') do
      xml.tag!('itunes:name', @user.username)
      xml.tag!('itunes:email', @user.email)
    end
    xml.tag!('itunes:image', 'href' => @user.image_link)
    xml.tag!('itunes:category', 'text' => 'TV & Film')
    xml.tag!('itunes:explicit', @user.explicit ? 'Yes' : 'No')
    @episodes.each do |episode|
      xml.item do
        xml.title episode.title
        xml.tag!('itunes:author', @user.username)
        xml.tag!('itunes:subtitle', episode.subtitle)
        xml.tag!('itunes:summary', episode.summary)
        xml.tag!('itunes:image', 'href' => episode.image_link)
        xml.tag!('enclosure', 'url' => episode.audio_link, 'length' => episode.length, 'type' => 'audio/mpeg')
        xml.guid episode.audio_link
        xml.pubDate episode.created_at.strftime('%d %b %Y %H:%M:%S %Z')
        xml.tag!('itunes:duration', episode.duration) 
      end
    end
  end
end
