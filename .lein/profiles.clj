{:user {
        :plugins [[lein-ancient "0.6.7"] ;; upgrade dependencies ;; lein ancient profiles
                  [cider/cider-nrepl "0.10.0-SNAPSHOT"] ;; only used to run nrepl using cider in emacs
                  [lein-midje "3.2-RC4"]
                 ]
        :dependencies [[spyscope "0.1.5"]
                       [org.clojars.gjahad/debug-repl "0.3.3"]
                       [org.clojure/tools.namespace "0.2.10"]
                       [leiningen "2.5.2"]
                       [io.aviso/pretty "0.1.18"]
                       [im.chit/vinyasa "0.3.4"]
                       ]
        :injections 
        [(require 'spyscope.core) ;; (reduce + #spy/p [1 2 3 4])
         (require '[vinyasa.inject :as inject])
         (require 'io.aviso.repl)
         (inject/in ;; the default injected namespace is `.` 

                    ;; note that `:refer, :all and :exclude can be used
                    [vinyasa.inject :refer [inject [in inject-in]]]  
                    [vinyasa.lein :exclude [*project*]]  

                    ;; imports all functions in vinyasa.pull
                    [vinyasa.pull :all]      

                    ;; same as [cemerick.pomegranate 
                    ;;           :refer [add-classpath get-classpath resources]]
                    [cemerick.pomegranate add-classpath get-classpath resources] 

                    ;; inject into clojure.core 
                    clojure.core
                    [vinyasa.reflection .> .? .* .% .%> .& .>ns .>var]

                    ;; inject into clojure.core with prefix
                    clojure.core >
                    [clojure.pprint pprint]
                    [alex-and-georges.debug-repl debug-repl] ;; (>debug-repl) ;; () to exit
                    [clojure.java.shell sh])]
         }}
