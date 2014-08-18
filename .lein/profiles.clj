{:user {
        :plugins [[lein-exec "0.3.4"] ; run scripts from the commandline
                  [lein-try "0.4.3"] ; try lib w/o including it as a depencies
                  [lein-kibit "0.0.8"] ; search for more idiomatic function
                  [lein-ancient "0.5.5"] ; upgrade dependencies
                  [cider/cider-nrepl "0.7.0-SNAPSHOT"] ; only used to run nrepl using cider in emacs
                  [lein-midje "3.1.3"] ; testing
                  ]
        :dependencies [[spyscope "0.1.4"] ; insert tracing statements
                       [leiningen "2.4.3"] ; required by vinyasa
                       [org.clojure/tools.namespace "0.2.5"] ; reload namespaces
                       [slamhound "1.5.5"] ; tidy up namespaces
                       [im.chit/vinyasa "0.2.2"] ; inject libs into namespace plus other stuff
                       ;[clj-ns-browser "1.3.1"] ; gui browser (doesn't seem to work with cider)
                       [org.clojars.gjahad/debug-repl "0.3.3"]
                       ] ; insert debut statements
        :injections [
                     ;http://dev.solita.fi/2014/03/18/pimp-my-repl.html
                     (require 'spyscope.core); (apply + #spy/p doto (range [11 21 2]))
                     ;(require 'clj-ns-browser.sdoc) 
                     ;(require 'midje.repl) 
                     (require 'alex-and-georges.debug-repl) 
                     (require '[vinyasa.inject :as inject])
                     (inject/in
                       clojure.core >
                      ;[clj-ns-browser.sdoc sdoc]
                        ;[midje.repl autotest]
                        [alex-and-georges.debug-repl debug-repl]; (>debug-repl) anywhere; () to continue
                        [clojure.tools.namespace.repl refresh]; (>refresh) to reload the repl
                        [clojure.repl doc source]
                        [clojure.pprint pprint pp]); (apply + (doto (range [11 21 2]) >pprint)
        ]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
