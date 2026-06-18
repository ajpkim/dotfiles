prompt = () => {
  let returnString = ''
  const dbName = db.getName()
  const isEnterprise = db.serverBuildInfo().modules.includes('enterprise')
  const mongoURL = db.getMongo()._uri.includes('mongodb.net')
  const nonAtlasEnterprise = isEnterprise && !mongoURL
  const usingAtlas = mongoURL && isEnterprise
  const readPref = db.getMongo().getReadPrefMode()
  const isLocalHost = /localhost|127\.0\.0\.1/.test(db.getMongo()._uri)
  const currentUser = db.runCommand({ connectionStatus: 1 }).authInfo.authenticatedUsers[0]?.user
  if (usingAtlas) {
    returnString += `Atlas || ${dbName} || ${currentUser} || ${readPref}\n=>`
  } else if (isLocalHost) {
    returnString += `${
      nonAtlasEnterprise ? 'Enterprise || localhost' : 'localhost'
    } || ${dbName} || ${readPref}\n=>`
  } else if (nonAtlasEnterprise) {
    returnString += `Enterprise || ${dbName} || ${currentUser} || ${readPref}\n=>`
  } else {
    returnString += `${dbName} || ${readPref}\n=>`
  }
  return returnString
}
