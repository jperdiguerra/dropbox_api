module DropboxApi::Results::RelocationBatch
  class Launch < DropboxApi::Results::Base
    def self.new(result_data)
      case result_data[".tag"]
      when "other"
        :other
      when "async_job_id"
        DropboxApi::Results::AsyncJob.new result_data
      when "complete"
        DropboxApi::Results::RelocationBatch::Result.new result_data
      else
        raise NotImplementedError, "Unknown result type: #{result_data[".tag"]}"
      end
    end
  end
end
