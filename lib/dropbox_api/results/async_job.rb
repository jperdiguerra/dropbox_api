module DropboxApi::Results
  class AsyncJob < DropboxApi::Results::Base
    def id
      @id ||= @data["async_job_id"]
    end
  end
end
