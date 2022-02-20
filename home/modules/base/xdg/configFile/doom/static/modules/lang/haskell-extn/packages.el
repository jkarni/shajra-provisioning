;;; -*- no-byte-compile: t; lexical-binding: t; -*-


(load! "modules/lang/haskell/packages" doom-emacs-dir)

;; DESIGN: match Doom
(package! haskell-mode :pin "8402caa341d90b4236f5c0a802751f9023ccfbe7")

(when (featurep! +dante)
  ;; DESIGN: target latest for both
  (package! dante :pin "8741419333fb85ed2c1d71f5902688f5201b0a40")
  (package! attrap :pin "19a520ecb99529790906a1fb5599acdf2b4f005f"))

(when (and (featurep! +lsp) (not (featurep! :tools lsp +eglot)))
  ;; DESIGN: match Doom
  (package! lsp-haskell :pin "4e62cf897dd9e9fcef25c6e8e483490a07a5d439"))
