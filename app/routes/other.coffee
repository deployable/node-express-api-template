# ## Routes `/other`

debug         = require('debug')('express-api:app:routes:other')
router        = require('express').Router()
pkg           = require('../../package.json')
body_parser   = require('body-parser').json


dummy = ( req, res )->
  res.json message: req.baseUrl

secure = ( req, res, next )->
  if req.header['x-api-token'] is 'me'
    next()
  else
    next('nope')


class OtherRequest

  @run: ( req, res, next )->
    
    param = req.body.param

    unless param
      return next("missing param")

    res.json 
      message: 'done'
      result: param


# ### Requests

router.use body_parser()

#router.use secure

router.get  '/', dummy

router.get  '/request', dummy
router.post '/request/run', OtherRequest.run
router.get  '/request/list', dummy

module.exports = router
