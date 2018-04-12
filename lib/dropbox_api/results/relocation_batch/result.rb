module DropboxApi::Results::RelocationBatch
  class Result < DropboxApi::Results::Base
    def entries
      @entries ||= @data["entries"].map do |entry|
        DropboxApi::Results::RelocationBatch::ResultData.new entry
      end
    end
  end
end
