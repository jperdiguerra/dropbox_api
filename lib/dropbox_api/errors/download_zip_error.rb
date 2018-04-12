module DropboxApi::Errors
  class DownloadZipError < BasicError
    ErrorSubtypes = {
      :path => LookupError,
      :too_large => TooLargeError,
      :too_many_files => TooManyFilesError
    }.freeze
  end
end
