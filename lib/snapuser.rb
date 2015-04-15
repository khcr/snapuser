require "snapuser/engine"

module Snapuser
  @@levels = {"superadmin" => "1", "admin" => "2"}

  mattr_accessor :levels
end
