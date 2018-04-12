module DropboxApi::Endpoints::Files
  class CopyBatchCheck < DropboxApi::Endpoints::Rpc
    Method      = :post
    Path        = "/2/files/copy_batch/check".freeze
    ResultType  = DropboxApi::Results::RelocationBatch::JobStatus
    ErrorType   = DropboxApi::Errors::PollError

    # Returns the status of an asynchronous job for copy_batch. If success,
    # it returns list of results for each entry.

    # @param async_job_id [String] Id of the asynchronous job. This is the value of
    #   a response returned from the method that launched the job.
    # @return The current status of the job.
    add_endpoint :copy_batch_check do |async_job_id|
      perform_request({
        :async_job_id => async_job_id
      })
    end
  end
end

