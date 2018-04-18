module DropboxApi::Results::DeleteBatch
  class Entry < DropboxApi::Results::Base
    def self.new(result_data)
      case result_data[".tag"]
      when "success"
        DropboxApi::Results::DeleteBatch::ResultData.new entry
      when "failure"
        DropboxApi::Results::DeleteError.build("Delete failed", result_data["failure"])
      else
        raise NotImplementedError, "Unknown result type: #{result_data[".tag"]}"
      end
    end
  end
end
