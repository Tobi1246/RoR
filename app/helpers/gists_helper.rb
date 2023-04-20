module GistsHelper

  def gist_to_hash(url)
    /(?<=com\/).*/.match(url)
  end

end
