module DropboxApi::Endpoints::Files
  class DeleteBatchCheck < DropboxApi::Endpoints::Rpc
    Method      = :post
    Path        = "/2/files/delete_batch/check".freeze
    ResultType  = DropboxApi::Results::DeleteBatch::JobStatus
    ErrorType   = DropboxApi::Errors::PollError

    # Delete multiple files/folders at once.
    # This route is asynchronous, which returns a job ID immediately and runs
    # the delete batch asynchronously. Use delete_batch/check to check the job
    # status.

    # @param entries [Array] List of (DeleteArg)
    #   DeleteArg
    #.    path [String(pattern="(/(.|[\r\n])*)|(ns:[0-9]+(/.*)?)|(id:.*)")]
    #       - Path in the user's Dropbox to delete.  
    #     parent_rev [String(min_length=9, pattern="[0-9a-f]+")?]
    #       - Perform delete if given "rev" matches the existing file's latest
    #         "rev". This field does not support deleting a folder. This field
    #         is optional.

    add_endpoint :delete_batch_check do |async_job_id|
      perform_request({
        :async_job_id => async_job_id
      })
    end
  end
end
