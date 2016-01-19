describe 'travis-yaml', ->
  Given -> @subject = require '../lib/travis-yaml'
  
  context 'sync', ->
    When -> @travis = @subject()
    Then -> @travis.should.eql
      language: "node_js"
      sudo: false
      install: [ "npm install" ]
      script: [ "gulp travis" ]
      node_js: [ "0.10", "0.12", "4", "5", "iojs-v1", "iojs-v2", "iojs-v3" ]
      cache:
        directories: [ "node_modules" ]

  context 'async', ->
    When (done) -> @subject (err, @travis) => done()
    Then -> @travis.should.eql
      language: "node_js"
      sudo: false
      install: [ "npm install" ]
      script: [ "gulp travis" ]
      node_js: [ "0.10", "0.12", "4", "5", "iojs-v1", "iojs-v2", "iojs-v3" ]
      cache:
        directories: [ "node_modules" ]
