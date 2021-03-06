require 'generators/ember/generator_helpers'

module Ember
  module Generators
    class ControllerGenerator < ::Rails::Generators::NamedBase
      include Ember::Generators::GeneratorHelpers

      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a new Ember.js controller."

      class_option :array, :type => :boolean, :default => false, :desc => "Create an Ember.ArrayController to represent multiple objects."
      class_option :object, :type => :boolean, :default => false, :desc => "Create an Ember.ObjectController to represent a single object."

      def create_controller_files
        file_path = File.join(app_path, 'controllers', class_path, "#{file_name}.js.es6")

        if options.array?
          template "array_controller.js.es6", file_path
        elsif options.object?
          template "object_controller.js.es6", file_path
        else
          template "controller.js.es6", file_path
        end
      end
    end
  end
end

