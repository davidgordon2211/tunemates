class GamePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def lobby?
    create?
  end

  def song_selection?
    create?
  end
  
  def category?
    true
  end
end
