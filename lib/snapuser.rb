require "snapuser/engine"

module Snapuser
  @@levels = {"superadmin" => "1", "admin" => "2"}
  @@superuser_level = 1
  @@can_edit = 2

  mattr_accessor :levels, :can_edit, :superuser_level
end