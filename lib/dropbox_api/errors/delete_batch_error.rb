module DropboxApi::Errors
  class DeleteBatchError < BasicError
    ErrorSubtypes = {
      :too_many_write_operations => TooManyWriteOperationsError
    }.freeze
  end
end
