;; -*- emacs-lisp -*-
(setq src "/home/torstein/src/p4")
(setq jdibug-connect-hosts (quote ("localhost:5005"))
      jdibug-use-jde-source-paths nil
      jdibug-source-paths
      (list
       (concat src "/projects/poc/inpage-poc/viziwyg-ws/src/main/java")
       (concat src "/projects/poc/inpage-poc/viziwyg-common/src/main/java")
       (concat src "/escenic/plugins/viziwyg/trunk/viziwyg-ws/src/main/java")
       (concat src "/branches/personal/torstein/memento/src/main/java")
       (concat src "/escenic/plugins/forum/branches/3.0/forum-core/src/main/java")
       (concat src "/escenic/plugins/forum/branches/3.0/forum-presentation/src/main/java")
       (concat src "/escenic/engine/branches/5.3/engine-core/src/main/java")
       (concat src "/escenic/engine/branches/5.3/engine-search/src/main/java")
       (concat src "/escenic/engine/branches/5.3/engine-webservice/src/main/java")
       (concat src "/escenic/plugins/dashboard/trunk/dashboard-core/src/main/java")
       (concat src "/escenic/plugins/community/branches/3.6/community-core/src/main/java")
       (concat src "/escenic/plugins/community/branches/3.6/community-common/src/main/java")
       (concat src "/escenic/plugins/community/branches/3.6/community-presentation/src/main/java")
       "/usr/lib/jvm/java-6-sun/src"
       )
)

(add-to-list 'load-path "/usr/local/src/emacs/jdibug-0.5")
;; version 0.4 of jdibug requires semantic
(setq semantic-load-turn-everything-on t)
(semantic-mode 1)

(require 'semantic/lex)
(require 'semantic/senator)
(require 'semantic/java)
(require 'semantic/ia)
(require 'semantic/ctxt)
(require 'semantic/wisent)
(require 'semantic/wisent/comp)
(require 'semantic/wisent/java-tags)

;; Use the full Java 1.5 grammer to parse Java
(autoload 'wisent-java-default-setup "wisent" "Hook run to setup Semantic in 'java-mode'." nil nil)
(require 'cl)
(require 'jdibug)


(defun my-jdibug-mode-hook ()
  ;; IDEA style debug short cuts
  (define-key c-mode-base-map [ (f7) ] 'jdibug-step-into)
  (define-key c-mode-base-map [ (f8) ] 'jdibug-step-over)
  (define-key c-mode-base-map [ (f9) ] 'jdibug-step-out)
  (define-key c-mode-base-map [ (f10) ] 'jdibug-resume)
  (global-set-key "\C-\M-b" 'jdibug-connect)
)
(add-hook 'c-mode-common-hook 'my-jdibug-mode-hook)
