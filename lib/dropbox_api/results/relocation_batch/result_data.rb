module DropboxApi::Results::RelocationBatch
  class ResultData < DropboxApi::Results::Base
    def entry
      DropboxApi::Metadata::Resource.new @data['metadata']
    end
  end
end
