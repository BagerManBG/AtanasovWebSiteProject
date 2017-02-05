function getQueryVariable(variable)
{
  var item = sessionStorage.getItem(variable);
  if (item == null) {
    return(false);
  } else {
    sessionStorage.removeItem(variable);
    return item;
  }
}
