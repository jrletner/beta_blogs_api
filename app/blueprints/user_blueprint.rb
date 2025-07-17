# frozen_string_literal: true

class UserBlueprint < Blueprinter::Base
  identifier :id


  view :normal do
    fields :first_name, :last_name, :username, :email
  end

  view :blogs do
    association :blogs, blueprint: BlogBlueprint
  end
end
