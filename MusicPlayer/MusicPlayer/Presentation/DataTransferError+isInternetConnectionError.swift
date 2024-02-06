extension Error
{
    var isInternetConnectionError: Bool
    {
        if let error = self as? DataTransferError,
           case .notConnected = error
        {
            return true
        }
        else
        {
            return false
        }
    }
}
