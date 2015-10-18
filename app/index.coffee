
# ## Express API Template

# The main express App

debug         = require('debug')('express-api:app')
express       = require('express')
passport      = require('passport')
pkg           = require('../package.json')
config        = require('../config.json')

# Support source map generation when not in production mode
unless process.env.NODE_ENV is 'production'
  require('source-map-support').install();


# Startup the app/server
app = express()

# Routes are setup externally
app.use '/', require('./routes')

# Listen
app.listen config.http.port, ( err )->
  console.log "Server listening on #{config.http.port}"

# Export the app for use elsewhere
module.exports.app = app
