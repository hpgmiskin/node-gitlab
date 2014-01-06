BaseModel = require './BaseModel'

class Issues extends BaseModel
  all: (params = {}, fn = null) =>
    if 'function' is typeof params
      fn = params
      params = {}
    @debug "Issues::all()"
    params.page ?= 1
    params.per_page ?= 100

    (->
      data = []
      cb = (retData) =>
        if retData.length == 100
          @debug "Recurse Issues::all()"
          data = data.concat(retData)
          params.page++
          @all params, cb
        else
          data = data.concat(retData)
          fn data if fn

      @get "issues", params, cb
    ).bind(@)()

module.exports = (client) -> new Issues client
