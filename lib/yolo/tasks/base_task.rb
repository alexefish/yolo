require 'xcodebuild'
require 'rake/tasklib'

module Yolo
  module Tasks
    #
    # A base task class to subclass from when creating tasks
    #
    # @author [Alex Fish]
    #
    class BaseTask < XcodeBuild::Tasks::BuildTask
      #
      # Defines available rake tasks
      #
      def define
        namespace :yolo do
          desc "Sets up yolo and moves config into place"
          task :setup do
            formatter = Yolo::Formatters::ProgressFormatter.new
            Yolo::Config::Settings.instance.load_config
            formatter.setup_complete
          end
        end
      end
    end
  end
end
