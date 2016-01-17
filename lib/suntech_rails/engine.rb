module SuntechRails
  class Engine < ::Rails::Engine
    isolate_namespace SuntechRails
    # initializer "suntech_rails.include_view_helpers" do |app|
    #   ActiveSupport.on_load :action_view do
    #     include SuntechRailsHelper
    #   end
    # end
  end
end
