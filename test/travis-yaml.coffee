sinon = require('sinon')
fs = require('fs')

describe 'travis-yaml', ->
  Given -> @fs =
    readFile: fs.readFile
    readFileSync: fs.readFileSync
  Given -> @subject = require('proxyquire').noCallThru() '../lib/travis-yaml',
    fs: @fs
  
  context 'sync', ->
    context 'no error', ->
      When -> @travis = @subject()
      Then -> @travis.should.eql
        language: "node_js"
        sudo: false
        install: [ "npm install" ]
        script: [ "gulp travis" ]
        node_js: [ "0.10", "0.12", "4", "5", "iojs-v1", "iojs-v2", "iojs-v3" ]
        cache:
          directories: [ "node_modules" ]

    context 'error', ->
      afterEach -> console.log.restore()
      Given -> sinon.stub console, 'log'
      Given -> @fs.readFileSync = sinon.stub()
      Given -> @fs.readFileSync.returns 'blah: -foo:'
      When -> @travis = @subject()
      Then ->
        (@travis == null).should.be.true()
        console.log.called.should.be.true()

  context 'async', ->
    context 'no error', ->
      When (done) -> @subject (err, @travis) => done()
      Then -> @travis.should.eql
        language: "node_js"
        sudo: false
        install: [ "npm install" ]
        script: [ "gulp travis" ]
        node_js: [ "0.10", "0.12", "4", "5", "iojs-v1", "iojs-v2", "iojs-v3" ]
        cache:
          directories: [ "node_modules" ]

    context 'error parsing', ->
      afterEach -> console.log.restore()
      Given -> sinon.stub console, 'log'
      Given -> @fs.readFile = sinon.stub()
      Given -> @fs.readFile.callsArgWith 1, null, 'blah: -foo:'
      When (done) -> @subject (@err, @travis) => done()
      Then ->
        @err.should.be.an.instanceOf(Error)
        (@travis == null).should.be.true()

    context 'error reading', ->
      afterEach -> console.log.restore()
      Given -> sinon.stub console, 'log'
      Given -> @fs.readFile = sinon.stub()
      Given -> @fs.readFile.callsArgWith 1, new Error('error'), null
      When (done) -> @subject (@err, @travis) => done()
      Then ->
        @err.message.should.eql 'error'
        (@travis == undefined).should.be.true()
