class CastMember < ApplicationRecord
    enum :role, [ :Actor, :Director, :Writer, :Producer ]
    belongs_to :movie
end
