;;; -*- no-byte-compile: t; lexical-binding: t; -*-


(load! "modules/lang/haskell/packages" doom-emacs-dir)

;; DESIGN: match Doom
(package! haskell-mode :pin "cb573c8db5b856eb37473009f2c62e0717a1cd02")

(when (featurep! +dante)
  ;; DESIGN: target latest for both
  (package! dante :pin "8741419333fb85ed2c1d71f5902688f5201b0a40")
  (package! attrap :pin "19a520ecb99529790906a1fb5599acdf2b4f005f"))

(when (and (featurep! +lsp) (not (featurep! :tools lsp +eglot)))
  ;; DESIGN: match Doom
  (package! lsp-haskell :pin "7cf64944ab3a25ea5d6f8d5e0cd33124182df991"))
