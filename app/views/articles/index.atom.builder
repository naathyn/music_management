atom_feed do |feed|
  feed.title( "Sam Raines Official Music News" )

  latest_article = @articles.sort_by(&:updated_at).last
  feed.updated( latest_article && latest_article.updated_at )

  @articles.each do |article|
    feed.entry( article ) do |entry|
      entry.title( article.content )
      entry.summary :type => 'xhtml' do |xhtml|
        xhtml.p( "Posted on #{article.timestamp}." )
      end
      entry.author { |author| author.name( "Sam Raines" ) }
    end
  end
end
