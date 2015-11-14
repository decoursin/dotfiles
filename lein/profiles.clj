;; By Nick DeCoursin

;; Helper: http://dev.solita.fi/2014/03/18/pimp-my-repl.html

{:user {:dependencies [
                       [org.clojure/tools.namespace "0.2.11"] ;;detects changes to source files and reloads the changed files and their dependents in the correct order
                       ;;Simply call (alembic.still/load-project)
                       ;; dynamically load dependencies while in repl
                       [alembic "0.3.2"]
                       ;;; NEW
                       [com.cemerick/pomegranate "0.3.0"]
                       [org.clojure/core.typed "0.3.18"]
                       [com.stuartsierra/class-diagram "0.1.0"] ; Generate & display class hierarchy diagrams for Java classes 
                       [org.clojure/tools.trace "0.7.9"]; trace, deftrace, trace-forms, trace-ns
                       [clj-ns-browser "1.3.1"]
                       [com.gfredericks/debug-repl "0.0.7"]
                       ]
        :plugins [
                  [lein-exec "0.3.5"]
                  [lein-pprint "1.1.1"] ;; lein pprint ;; print project map
                  [lein-ancient "0.6.7"] ;; lein ancient ; Checks for outdated plugins
                  [lein-deps-tree "0.1.2"] ;to run: lein deps-tree
                  ;;t0Do: read the docs of this still tho.
                  ;;http://thinkrelevance.com/blog/2013/06/04/clojure-workflow-reloaded
                  [cider/cider-nrepl "0.10.0-SNAPSHOT"]
                  ;[com.cemerick/piggieback "0.2.1"] (deprecated) ;ClojureScript repl
                  ;;;; NEW
                  [org.bodil/lein-nashorn "0.1.2"]
                  [lein-kibit "0.1.2"] ;; suggests code to be rewritten to be more idiomatic
                  [com.palletops/lein-shorthand "0.4.0"]
                  ]
        :repl-options {:nrepl-middleware ;; attn: this is not a vector of vector but one vector.
                        [
                         clojure.core.typed.repl/wrap-clj-repl
                         com.gfredericks.debug-repl/wrap-debug-repl
                         ]
                       }
        :shorthand {
                    . [alembic.still/distill alembic.still/lein]
                    }
        }
 :repl {:plugins []
        :dependencies [
                       [org.clojure/math.numeric-tower "0.0.4"]
                       [org.clojure/core.async "0.2.374"]
                       [org.clojure/math.combinatorics "0.1.1"]
                       [incanter "1.9.0"]
                       ]
        }
 }
        ;The :repl-options bit causes lein repl to automagically mix the Piggieback nREPL middleware into its default stack.
        ;; :repl-options {:nrepl-middleware [com.cemerick.piggieback/wrap-cljs-repl]}}}
;        :repl-options {:nrepl-middleware
;                       [clojure.core.typed.repl/wrap-clj-repl]}}}


;; Potentials:
;;https://github.com/zcaudate/vinyasa
;; io.aviso/pretty
;; spyscope
;; codox
