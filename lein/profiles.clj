{:user {:plugins [[lein-exec "0.3.5"]
                  [lein-pprint "1.1.1"] ;; lein pprint ;; print project map
                  [lein-ancient "0.6.7"] ;; lein ancient ; Checks for outdated plugins
                  [lein-kibit "0.1.2"] ;; suggests code to be rewritten to be more idiomatic
                  [cider/cider-nrepl "0.10.0-SNAPSHOT"]]
        :dependencies [[com.cemerick/pomegranate "0.3.0"]]}
 :repl {:dependencies [[org.clojure/math.numeric-tower "0.0.4"]]}}
