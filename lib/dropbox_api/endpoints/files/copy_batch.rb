module DropboxApi::Endpoints::Files
  class CopyBatch < DropboxApi::Endpoints::Rpc
    Method      = :post
    Path        = "/2/files/copy_batch".freeze
    ResultType  = DropboxApi::Results::RelocationBatch::Launch
    ErrorType   = nil

    include DropboxApi::Endpoints::OptionsValidator
    include DropboxApi::Endpoints::PropertyGroupsFormatter

    # Copy multiple files or folders to different locations at once in the
    # user's Dropbox.

    # If RelocationBatchArg.allow_shared_folder is false, this route is atomic.
    # If on entry failes, the whole transaction will abort. If
    # RelocationBatchArg.allow_shared_folder is true, not atomicity is
    # guaranteed, but you will be able to copy the contents of shared folders
    # to new locations.

    # This route will return job ID immediately and do the async copy job in
    # background. Please use copy_batch/check to check the job status.


    # @param entries [Array] List of entries to be moved or copied. Each entry
    #   is RelocationPath.
    # @option allowed_shared_folder [Boolean] If true, copy_batch will copy
    #   contents in shared folder, otherwise
    #   RelocationError.cant_copy_shared_folder will be returned if
    #   RelocationPath.from_path contains shared folder. This field is always
    #   true for move_batch. The default for this field is False.
    # @option autorename [Boolean] If there's a conflict with any file, have
    #   the Dropbox server try to autorename that file to avoid the conflict.
    #   The default for this field is False.
    # @option allow_ownership_transfer [Boolean] Allow moves by owner even if
    #   it would result in an ownership transfer for the content being moved.
    #   This does not apply to copies. The default for this field is False.

    add_endpoint :copy_batch do |entries, options = {}|
      validate_options([
        :allow_shared_folder,
        :autorename,
        :allow_ownership_transfer
      ], options)
      options[:allow_shared_folder] ||= false
      options[:autorename] ||= false
      options[:allow_ownership_transfer] ||= false
      format_property_groups(options)

      perform_request options.merge({
        :entries => entries
      })
    end
  end
end
