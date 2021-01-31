class Docker < Thor
  include Thor::Actions

  desc "bash", "starts docker bash"
  def bash
    run "docker-compose run app bash"
  end

  default_task :bash
end