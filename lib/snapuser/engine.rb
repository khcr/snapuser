module Snapuser
  class Engine < ::Rails::Engine

    initializer "Snapuser.append_migrations" do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    initializer 'Snapuser.action_controller' do |app|
      ActionController::Base.send :include, SessionsHelper
    end
  end
end
