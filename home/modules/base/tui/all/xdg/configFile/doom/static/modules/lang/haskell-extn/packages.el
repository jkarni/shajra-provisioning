;;; -*- no-byte-compile: t; lexical-binding: t; -*-


(load! "modules/lang/haskell/packages" doom-emacs-dir)

;; DESIGN: match Doom
(package! haskell-mode :pin "cb573c8db5b856eb37473009f2c62e0717a1cd02")

(when (featurep! +dante)
  ;; DESIGN: target latest for both
  (package! dante :pin "1ab4d9520d17cd37d1f370d1c8adebf4d9d3f737")
  (package! attrap :pin "ecfdf357f4bde6d9acb0826c82a32e72e9c4972f"))

(when (and (featurep! +lsp) (not (featurep! :tools lsp +eglot)))
  ;; DESIGN: match Doom
  (package! lsp-haskell :pin "7cf64944ab3a25ea5d6f8d5e0cd33124182df991"))
