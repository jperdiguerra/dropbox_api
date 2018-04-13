module DropboxApi::Results::RelocationBatch
  class JobStatus < DropboxApi::Results::Base
    def self.new(result_data)
      case result_data[".tag"]
      when "in_progress"
        :in_progress
      when "other"
        :other
      when "complete"
        DropboxApi::Results::RelocationBatch::Result.new result_data
      when "failed"
        DropboxApi::Errors::RelocationBatchError.build("Async delete job failed", result_data["failed"])
      else
        raise NotImplementedError, "Unknown result type: #{result_data[".tag"]}"
      end
    end
  end
end
