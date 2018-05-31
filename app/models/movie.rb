class Movie < ApplicationRecord
  # Direct associations

  has_many   :castings,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
