# ## Routes `/`

debug       = require('debug')('express-api:app:routes')
router      = require('express').Router()
pkg         = require('../../package.json')


# Include any sub routes
router.use '/other', require('./other')

# Requests
router.get '/', ( req, res )->
  res.json message: "Welcome to #{pkg.name} #{pkg.version}"


module.exports = router
