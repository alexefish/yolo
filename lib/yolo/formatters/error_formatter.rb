require 'xcodebuild'

module Yolo
  module Formatters
    #
    # Outputs formatted error messages to the console
    #
    # @author [Alex Fish]
    #
    class ErrorFormatter < XcodeBuild::Formatters::ProgressFormatter

      #
      # Outputs a red string stating that the required directory paths are missing
      #
      def coverage_directory_error
        puts red("Aborting coverage calculation, coverage requires a build path and output directory")
      end

      #
      # Outputs a red string stating that the info.plist file could not be found
      #
      def info_plist_not_found
        puts red("Can't locate Info.plist, is it in your project root?")
      end

      #
      # Outputs a red string stating that setup is required
      #
      def run_setup
        puts red("Setup required, running rake yolo:setup")
      end

      #
      # Outputs a red string stating the the deployment class is invalid
      # @param  klass [String] The deployment class name
      #
      def deployment_class_error(klass)
        puts red("#{klass} is not a valid Class in the Deployment module")
      end

      #
      # Outputs a red string stating that there was an issue deploying the ipa
      # @param  error [String] The error string
      #
      def deploy_failed(error)
        puts red("There was a problem deploying the ipa: #{error}")
      end

      #
      # Outputs a red string stating that there was an issue deploying the bundle to github
      # @param  error [String] The error string
      #
      def github_upload_failed(error)
        puts red("There was a problem deploying the bundle to github: #{error}")
      end

      #
      # Outputs a red string stating that no deploy URL was found in the config file
      #
      def no_deploy_url
        puts red("No deploy url found, please specify one in ~/.yolo/config.yml")
      end

      #
      # Outputs a red string stating that no API token is defined
      #
      def no_api_token
        puts red("No API token is defined in config.yml")
      end

      #
      # Outputs a red string stating that no team token is defined
      #
      def no_team_token
        puts red("No team token is defined in config.yml")
      end

      #
      # Outputs a red string stating that email notification failed because of missing details
      #
      def missing_email_details
        puts red("Can't send mail notification, missing details")
      end

      #
      # Outputs a red string stating that the github token is missing in config
      #
      def no_github_token
        puts red("No Github token found, please specify one in ~/.yolo/config.yml ")
      end

      #
      # Outputs a red string stating that there was a problem creating a github release
      #
      def no_github_release
        puts red("There was a problem creating the release, maybe the tag already exists")
      end

      #
      # Outputs a red string stating that a release notes file could not be found
      # @param  notes [String] The path which should contain a notes file
      #
      def no_notes(notes)
        puts red("No release notes found in the current directory: #{notes}")
      end

    end
  end
end
