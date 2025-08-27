bool isNearExpiry(DateTime? expiryDate, DateTime now, {int thresholdDays = 3}) {
  if (expiryDate == null) return false;
  return expiryDate.difference(now).inDays <= thresholdDays;
}
