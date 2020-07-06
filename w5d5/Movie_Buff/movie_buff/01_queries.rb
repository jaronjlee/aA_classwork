def it_was_ok
  # Consider the following:
  #
  # Movie.where(yr: 1970..1979)
  #
  # We can use ranges (a..b) inside a where method.
  #
  # Find the id, title, and score of all movies with scores between 2 and 3

  Movie
    .select("id, title, score")
    .where("score BETWEEN 2 AND 3")
end

def harrison_ford
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .where(movies: { title: 'Blade Runner' })
  #
  # It's possible to join based on active record relations defined in models.
  #
  # Find the id and title of all movies in which Harrison Ford
  # appeared but not as a lead actor
  Movie
    .select(:id, :title)
    .joins(:actors)
    .where("actors.name = 'Harrison Ford' AND castings.ord != 1")
end

# expected collection contained:  [{"id"=>5, "title"=>"Star Wars: Episode V - The Empire Strikes Back"}, {"id"=>13, "title"=>"Star Wars...calypse Now"}, {"id"=>371, "title"=>"American Graffiti"}, {"id"=>700, "title"=>"Conversation, The"}]
# actual collection contained:    [{"id"=>5, "title"=>"Star Wars: Episode V - The Empire Strikes Back"}, {"id"=>5, "title"=>"Star Wars:...sation, The"}, {"id"=>700, "title"=>"Conversation, The"}, {"id"=>700, "title"=>"Conversation, The"}]
# the extra elements were:        [{"id"=>5, "title"=>"Star Wars: Episode V - The Empire Strikes Back"}, {"id"=>5, "title"=>"Star Wars:...sation, The"}, {"id"=>700, "title"=>"Conversation, The"}, {"id"=>700, "title"=>"Conversation, The"}]

    # SELECT
    #   movies.title
    # FROM
    #   movies
    # JOIN
    #   castings ON castings.movie_id = movies.id
    # JOIN
    #   actors ON actors.id = castings.actor_id
    # WHERE
    #   (actors.name = 'Harrison Ford' AND castings.ord != 1);


def biggest_cast
  # Consider the following:
  #
  # Actor
  #   .joins(:movies)
  #   .group('actors.id')
  #   .order('COUNT(movies.id) DESC')
  #   .limit(1)
  #
  # Sometimes we need to use aggregate SQL functions like COUNT, MAX, and AVG.
  # Often these are combined with group.
  #
  # Find the id and title of the 3 movies with the
  # largest casts (i.e most actors)

  Movie
    .select(:id, :title)
    .joins(:actors)
    .group(:id)
    .order("COUNT(name) DESC")
    .limit(3)

end

def directed_by_one_of(them)
  # Consider the following:
  #
  # Movie.where('yr IN (?)', years)
  #
  # We can use IN to test if an element is present in an array.
  #
  # ActiveRecord gives us an even better way to write this:
  #
  # Movie.where(yr: years)
  #
  # Find the id and title of all the movies directed by one of 'them'.

  Actor
    .select("movies.id, movies.title")
    .joins(:directed_movies)
    .where("actors.name IN (?)", them)

  # Movie
  #   .select(:id, :title)
  #   .joins(:director)
  #   .where(:actors { name: them })

end

def movie_names_before_1940
  # Consider the following:
  #
  # Movie.where('score < 2.0').pluck(:title)
  # => ['Police Academy: Mission to Moscow']
  #
  # Pluck works similarly to select, except that it converts a query result
  # directly into a Ruby Array instead of an ActiveRecord object. This can
  # improve performace for larger queries.
  #
  # Use pluck to find the title of all movies made before 1940.

  Movie.where('yr < 1940').pluck(:title)

end
