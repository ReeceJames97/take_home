String getNoNull(String value) {
  if (value == null || value.isEmpty) {
    return "";
  } else {
    return value;
  }
}

///Check Text is Empty or Null or Blank
bool isNotNullEmptyString(String value) {
  if (value == null) {
    return false;
  } else if (value.isEmpty) {
    return false;
  } else if (value.toLowerCase() == "null".toLowerCase()) {
    return false;
  } else if (value.trim().isEmpty) {
    return false;
  } else {
    return true;
  }
}

