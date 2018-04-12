module DropboxApi::Results
  class DownloadZipResult < DropboxApi::Results::Base
    def folder
      @folder ||= DropboxApi::Metadata::Folder.new(@data["metadata"])
    end
  end
end
