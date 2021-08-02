require 'polaris_view_helpers/helper'
require 'action_view'

module PolarisViewHelpers
  ActionView::Base.send :include, PolarisViewHelpers::Helper

  class Engine < Rails::Engine
  end
end
