module ApplicationHelper

  def star_rating(rating)
    output = ""
    rating.to_i.times { output += fa_icon "star" }
    output
  end

end
