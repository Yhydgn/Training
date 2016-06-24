# Can I haz ugly namespaces?
Mashup =
  Model: {}
  Collection: {}
  View: {}

# Resolving xml namespace issues
Jath.resolver = (prefix) ->
  'http://www.w3.org/2003/01/geo/wgs84_pos#' if prefix == 'geo'

# Ruby .times look-alike
Number::times = (fn) ->
  do fn for [1..@valueOf()]
  return
