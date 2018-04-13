module DropboxApi::Endpoints::Files
  class DownloadZip < DropboxApi::Endpoints::ContentDownload
    Method      = :post
    Path        = "/2/files/download_zip".freeze
    ResultType  = DropboxApi::Results::DownloadZipResult
    ErrorType   = DropboxApi::Errors::DownloadZipError

    # Download a folder from the user's Dropbox, as a zip file. The folder
    # must be less than 1 GB in size and have fewer than 10,000 total files.
    # The input cannot be a single file.
    #
    # @param path [String] Can be path, id or revision.
    add_endpoint :download_zip do |path, &block|
      perform_request({:path => path}, &block)
    end
  end
end
