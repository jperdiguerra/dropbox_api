module DropboxApi::Results::DeleteBatch
  class JobStatus < DropboxApi::Results::Base
    def self.new(result_data)
      case result_data[".tag"]
      when "in_progress"
        :in_progress
      when "other"
        :other
      when "complete"
        DropboxApi::Results::DeleteBatch::Result.new result_data
      when "failed"
        DropboxApi::Errors::DeleteBatchError.build("Async job failed", result_data["failed"])
      else
        raise NotImplementedError, "Unknown result type: #{result_data[".tag"]}"
      end
    end
  end
end
