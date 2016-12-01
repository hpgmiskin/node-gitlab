BaseModel = require '../BaseModel'
Utils = require '../Utils'

class ProjectKeys extends BaseModel

  listKeys: (projectId, fn = null) =>
    @debug "ProjectKeys::listKeys()"
    @get "projects/#{Utils.parseProjectId projectId}/deploy_keys", (data) => fn data if fn

  getKey: (projectId, keyId, fn = null) =>
    @debug "ProjectKeys::getKey()"
    @get "projects/#{Utils.parseProjectId projectId}/deploy_keys/#{parseInt keyId}", (data) => fn data if fn

  addKey: (projectId, params = {}, fn = null) =>
    @debug "ProjectKeys::addKey()"
    @post "projects/#{Utils.parseProjectId projectId}/deploy_keys", params, (data) => fn data if fn

module.exports = (client) -> new ProjectKeys client
