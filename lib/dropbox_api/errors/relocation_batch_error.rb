module DropboxApi::Errors
  class RelocationBatchError < BasicError
    ErrorSubtypes = {
      :from_lookup => LookupError,
      :from_write => WriteError,
      :to => WriteError,
      :cant_copy_shared_folder => CantCopySharedFolderError,
      :cant_nest_shared_folder => CantNestSharedFolderError,
      :cant_move_folder_into_itself => CantMoveFolderIntoItselfError,
      :too_many_files => TooManyFilesError,
      :duplicated_or_nested_paths => DuplicatedOrNestedPathsError,
      :cant_transfer_ownership => CantTransferOwnershipError,
      :insufficient_quota => InsufficientQuotaError,
      :too_many_write_operations => TooManyWriteOperationsError
    }.freeze
  end
end
