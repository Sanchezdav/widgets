class Widget < ApplicationRecord
  belongs_to :manufacturer

  def user_facing_identifier
    id_as_string = self.id.to_s
    return id_as_string if id_as_string.length < 3

    "%{first}.%{last_two}" % {
      first: id_as_string[0..-3],
      last_two: id_as_string[-2..-1]
    }
  end

  def self.fresh
    self.where(status: "fresh")
  end
end
