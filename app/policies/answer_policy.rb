class AnswerPolicy
  attr_reader :user, :answer

  def initialize(user, answer)
    @user = user
    @answer = answer
  end

  def update?
  end

  def create?
  end
end
