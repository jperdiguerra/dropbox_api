module DropboxApi::Results::RelocationBatch
  class Result < DropboxApi::Results::Base
    def entries
      @entries ||= @data["entries"].map do |entry|
        DropboxApi::Metadata::Resource.new(entry['metadata'])
      end
    end
  end
end
