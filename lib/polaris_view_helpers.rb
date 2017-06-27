require 'polaris_view_helpers/helper'

module PolarisViewHelpers
  ActionView::Base.send :include, PolarisViewHelpers::Helper

  class Engine < Rails::Engine
  end
end
