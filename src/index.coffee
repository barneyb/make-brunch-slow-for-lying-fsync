module.exports = class SlowBrunch
    brunchPlugin: yes

    constructor: (@config) ->

    onCompile: (generatedFiles)=>
        console.log "about to be slow!", new Date()
