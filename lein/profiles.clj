;; By Nick DeCoursin

;; Helper: http://dev.solita.fi/2014/03/18/pimp-my-repl.html

{:user {:dependencies [
                       [org.clojure/tools.namespace "0.2.11"] ;;detects changes to source files and reloads the changed files and their dependents in the correct order
                       ;;Simply call (alembic.still/load-project)
                       ;; dynamically load dependencies while in repl
                       [org.clojure/tools.nrepl "0.2.12"]
                       [alembic "0.3.2"]
                       ;;; NEW
                       
                       ;;"http://weavejester.github.io/medley/medley.core.html"
                       [clj-stacktrace "0.2.8"]
                       [medley "0.7.0"]; useful functions.
                       [com.taoensso/timbre "4.2.0"] ;; logging.
                       [spyscope "0.1.5"] ;; learn. spy, etc. for debugging.
                       [org.clojure/algo.generic "0.1.2"] ; fmap.
                       ;[tupelo "0.1.54"] breaks this for some reason
                       [com.cemerick/pomegranate "0.3.0"]
                       ;; [org.clojure/core.typed "0.3.18"]
                       [com.stuartsierra/class-diagram "0.1.0"] ; Generate & display class hierarchy diagrams for Java classes 
                       [org.clojure/tools.trace "0.7.9"]; trace, deftrace, trace-forms, trace-ns
                       [prismatic/schema "1.0.3"]
                       ;; [clj-ns-browser "1.3.1"] ; breaks things when using ring too
                       [clj-http "2.0.0"]
                       [com.gfredericks/debug-repl "0.0.7"]
                       [cider/cider-nrepl "0.11.0-SNAPSHOT"]
                       [com.cemerick/piggieback "0.2.1"]
                       ]
        :plugins [
                  [lein-exec "0.3.5"]
                  [lein-pprint "1.1.1"] ;; lein pprint ;; print project map
                  [lein-ancient "0.6.7"] ;; lein ancient ; Checks for outdated plugins
                  [lein-deps-tree "0.1.2"] ;to run: lein deps-tree
                  ;;t0Do: read the docs of this still tho.
                  ;;http://thinkrelevance.com/blog/2013/06/04/clojure-workflow-reloaded
                  [refactor-nrepl "2.4.0-SNAPSHOT"]
                  ;;;; NEW
                  [com.jakemccrary/lein-test-refresh "0.12.0"] ;; automatica when new changes.
                  [lein-kibit "0.1.2"] ;; suggests code to be rewritten to be more idiomatic
                  [com.palletops/lein-shorthand "0.4.0"]
                  ]
        :repl-options {:nrepl-middleware ;; attn: this is not a vector of vector but one vector.
                        [
                         cemerick.piggieback/wrap-cljs-repl
                         ;clojure.core.typed.repl/wrap-clj-repl
                         ;; com.gfredericks.debug-repl/wrap-debug-repl
                         ]
                       :repl-options {:init (set! *print-length* 50)}
                       }
        :shorthand {
                    . [alembic.still/distill alembic.still/lein] ; ex: ./distill
;                    :spy [tupelo.core/spy]
                    }
        :injections [(let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                            'print-cause-trace)
                           new (ns-resolve (doto 'clj-stacktrace.repl require)
                                           'pst)]
                       (alter-var-root orig (constantly (deref new))))]
        }
 :repl {:plugins [
                  [lein-environ "1.0.0"]
                  [cider/cider-nrepl "0.11.0-SNAPSHOT"]
                  ]
        :dependencies [
                       [acyclic/squiggly-clojure "0.1.4"]
                       [org.clojure/core.typed "0.3.7"]
                       [jonase/eastwood "0.2.1" :exclusions [org.clojure/clojure]]
                       [jonase/kibit "0.1.2"]
                       ^:replace [org.clojure/tools.nrepl "0.2.12"]
                       [org.clojure/math.numeric-tower "0.0.4"]
                       [org.clojure/core.async "0.2.374"]
                       [org.clojure/math.combinatorics "0.1.1"]
                       [incanter "1.9.0"]
                       ]
        }
 :env {:squiggly {:checkers [:eastwood :typed :kibit]
                  :eastwood-exclude-linters [:unlimited-use]}}
 }
        ;The :repl-options bit causes lein repl to automagically mix the Piggieback nREPL middleware into its default stack.
;        :repl-options {:nrepl-middleware
;                       [clojure.core.typed.repl/wrap-clj-repl]}}}


;; Potentials:
;;https://github.com/zcaudate/vinyasa
;; io.aviso/pretty
;; spyscope
;; codox
