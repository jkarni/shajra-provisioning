;;; -*- no-byte-compile: t; lexical-binding: t; -*-


(load! "modules/lang/haskell/packages" doom-emacs-dir)

;; DESIGN: match Doom
(package! haskell-mode :pin "cb573c8db5b856eb37473009f2c62e0717a1cd02")

(when (featurep! +dante)
  ;; DESIGN: target latest for both
  (package! dante :pin "b81081c2eb8dcbd7e67e05cf5e1991df6cf3e57c")
  (package! attrap :pin "62fbd5f2665f0001f9c6a2dd0622edda7f4431da"))

(when (and (featurep! +lsp) (not (featurep! :tools lsp +eglot)))
  ;; DESIGN: match Doom
  (package! lsp-haskell :pin "7cf64944ab3a25ea5d6f8d5e0cd33124182df991"))
