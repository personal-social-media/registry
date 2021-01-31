class Git < Thor
  include Thor::Actions

  desc "tag_minor", "increments minor tag and pushes"
  def tag_minor
    run "git-version-bump mi"
  end
end