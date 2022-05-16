class MoviePolicy < ApplicationPolicy
  class Scope < Scope

    # NOTE: Be explicit about which records you allow access to!
     def resolve
      #byebug
      if user.present?
         if user.Admin?
          scope.where(genre: "Draft")
         else
          scope.where(genre: "Published")
         end
      end
     end
  end
# def edit?
 
#   update? 
# end
def update?
  if user.present?
   user.Moderator? || user.Admin?

  end
end

def create?
   if user.present?
    user.Moderator? 
  end
end
# def show?
#   if user.present?
#     user.Member?
#   end
# end
end
