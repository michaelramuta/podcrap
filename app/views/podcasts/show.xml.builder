xml.instruct!
xml.rss "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd", "version" => "2.0", "xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do 
    xml.title @podcast.title
    xml.link @podcast.website
    xml.language 'en-us'
    xml.copyright @podcast.copyright
    xml.tag!('itunes:subtitle', @podcast.subtitle)
    xml.tag!('itunes:author', @podcast.username)
    xml.tag!('itunes:summary', @podcast.summary)
    xml.description @podcast.description
    xml.tag!('itunes:owner') do
      xml.tag!('itunes:name', @podcast.username)
      xml.tag!('itunes:email', @podcast.user.email)
    end
    xml.tag!('atom:link', 'href' => "http://www.podcarp.com/podcasts/#{@podcast.id}.xml", 'rel' => 'self', 'type' => 'application/rss+xml')
    xml.tag!('itunes:image', 'href' => url_formatter(@podcast.image_link))
    xml.tag!('itunes:category', 'text' => @podcast.category)
    xml.tag!('itunes:explicit', @podcast.explicit ? 'Yes' : 'No')
    @episodes.sort{|a, b| b.created_at <=> a.created_at}.each do |episode|
      xml.item do
        xml.title episode.title
        xml.tag!('itunes:author', @podcast.username)
        xml.tag!('itunes:subtitle', episode.subtitle)
        xml.tag!('itunes:summary', episode.summary)
        xml.tag!('itunes:image', 'href' => url_formatter(episode.image_link))
        xml.tag!('enclosure', 'url' => url_formatter(episode.audio_link), 'length' => episode.length.gsub(/\D/, ''), 'type' => 'audio/mpeg')
        xml.guid url_formatter(episode.audio_link)
        xml.pubDate episode.created_at.to_s(:rfc822)
        xml.tag!('itunes:duration', episode.duration) 
      end
    end
  end
end
