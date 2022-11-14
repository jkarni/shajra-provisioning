;;; -*- no-byte-compile: t; lexical-binding: t; -*-


(load! "modules/lang/haskell/packages" doom-emacs-dir)

;; DESIGN: match Doom
(package! haskell-mode :pin "90503413f4cdb0ed26871e39c4e6e2552b57f7db")

(when (modulep! +dante)
  ;; DESIGN: target latest for both
  (package! dante :pin "f7560257e928105c45814be130fa9c0ac557d975")
  (package! attrap :pin "7cf39d3227d2e99bb2d627bb47fdd90c10a7675a"))

(when (and (modulep! +lsp) (not (modulep! :tools lsp +eglot)))
  ;; DESIGN: match Doom
  (package! lsp-haskell :pin "485c1148ce4d27030bb95b21c7289809294e7d31"))
