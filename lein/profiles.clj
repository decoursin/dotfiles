;; By Nick DeCoursin

;; http://dev.solita.fi/2014/03/18/pimp-my-repl.html
;;The :dev profile is meant for development-time settings, and it's not active during the jar and uberjar tasks. If we add a new source directory in the :dev profile, its contents will be added to the classpath when we start a REPL, but when we're packaging our project, it's as if the directory didn't exist.

{:user {:plugins [[lein-exec "0.3.5"]
                  [lein-pprint "1.1.1"] ;; lein pprint ;; print project map
                  [lein-ancient "0.6.7"] ;; lein ancient ; Checks for outdated plugins
                  [lein-deps-tree "0.1.2"] ;to run: lein deps-tree
                  [lein-kibit "0.1.2"] ;; suggests code to be rewritten to be more idiomatic
                  [com.stuartsierra/class-diagram "0.1.0"] ; Generate & display class hierarchy diagrams for Java classes 
                  [com.palletops/lein-shorthand "0.4.0"]
                  [org.bodil/lein-nashorn "0.1.2"]

                  ;;t0Do: read the docs of this still tho.
                  ;;http://thinkrelevance.com/blog/2013/06/04/clojure-workflow-reloaded
                  [org.clojure/tools.trace "0.7.9"]; trace, deftrace, trace-forms, trace-ns
                  [org.clojure/tools.namespace "0.2.11"] ;;detects changes to source files and reloads the changed files and their dependents in the correct order
                  [cider/cider-nrepl "0.10.0-SNAPSHOT"]
                  ]
        :dependencies [[com.cemerick/pomegranate "0.3.0"]
                       ;;Simply call (alembic.still/load-project)
                       ;; dynamically load dependencies while in repl
                       [alembic "0.3.2"]
                       ]
        :shorthand {. [alembic.still/distill alembic.still/lein]
                    }}
 :repl {:plugins []
        :dependencies [[org.clojure/math.numeric-tower "0.0.4"]
                       [org.clojure/core.async "0.2.374"]
                       [org.clojure/math.combinatorics "0.1.1"]
                       [incanter "1.9.0"]
                       ]}
 :dev  {:plugins []
        :dependencies [[org.clojure/core.typed "0.3.11"]
                       [com.cemerick/piggieback "0.2.1"] ;ClojureScript repl
                       ]}}
        ;The :repl-options bit causes lein repl to automagically mix the Piggieback nREPL middleware into its default stack.
        ;; :repl-options {:nrepl-middleware [com.cemerick.piggieback/wrap-cljs-repl]}}}
;        :repl-options {:nrepl-middleware
;                       [clojure.core.typed.repl/wrap-clj-repl]}}}


;; Potentials:
;;https://github.com/GeorgeJahad/debug-repl
;;https://github.com/zcaudate/vinyasa
