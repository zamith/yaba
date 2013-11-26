ROOT = File.dirname(__FILE__)
APP_ROOT = ROOT.concat("/app")

Bundler.require(:master)
require "#{APP_ROOT}/repository"

class Core
  def self.configure
    @repo_type = :memory
    yield self
    post_config
  end

  def self.repository=(repo_type)
    @repo_type = repo_type
  end

  def self.post_config
    load_repo
    require "#{APP_ROOT}/listeners"
  end

  def self.load_repo
    require "#{APP_ROOT}/repositories/posts/#{@repo_type.to_s}"

    Repository.register :post, Kernel.const_get("Repositories::Posts::#{@repo_type.to_s.split('_').map(&:capitalize).join}").new
  end
end
