sleep = require('sleep')

module.exports = class SlowBrunch
    brunchPlugin: yes

    constructor: (@config) ->
        # Defaults options
        @options = {
            # Force digest-brunch to run in all environments when true.
            alwaysRun: false
            # Run in specific environments
            environments: ['production']
            # how long to delay(in ms)
            delay: 0
        }

        # Merge config
        cfg = @config.plugins?.makeBrunchSlow ? {}
        @options[k] = cfg[k] for k of cfg

    onCompile: (generatedFiles)=>
        if (@config.env[0] in @options.environments) or @options.alwaysRun
            console.log "about to be #{@options.delay}ms slower!", new Date()
            sleep.usleep(@options.delay * 1000)
