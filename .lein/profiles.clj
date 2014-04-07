{:user {
        :plugins [[lein-exec "0.3.2"] ; run scripts from the commandline
                  [lein-try "0.4.1"] ; try lib w/o including it as a depencies
                  [lein-kibit "0.0.8"] ; search for more idiomatic function
                  [lein-ancient "0.5.5"] ; upgrade dependencies
                  [lein-midje "3.1.3"]] ; testing
        :dependencies [[spyscope "0.1.4"] ; insert tracing statements
                       [leiningen "2.3.4"] ; required by vinyasa
                       [org.clojure/tools.namespace "0.2.4"] ; reload namespaces
                       [slamhound "1.5.2"] ; tidy up namespaces
                       [im.chit/vinyasa "0.1.8"] ; inject libs into namespace plus other stuff
                       [clj-ns-browser "1.3.1"] ; gui browser
                       [org.clojars.gjahad/debug-repl "0.3.3"]] ; insert debut statements
        :injections [(require 'spyscope.core)
                     (require 'clj-ns-browser.sdoc)
                     ; (require 'midje.repl)
                     (require 'alex-and-georges.debug-repl) 
                     (require 'vinyasa.inject)
                     (vinyasa.inject/inject 'clojure.core '>
                      '[[clj-ns-browser.sdoc sdoc]
                        ; [midje.repl autotest]
                        [alex-and-georges.debug-repl debug-repl]
                        [clojure.tools.namespace.repl refresh]
                        [clojure.repl doc source]
                        [clojure.pprint pprint pp]])]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}}
