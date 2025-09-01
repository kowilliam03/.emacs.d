;; -*- lexical-binding: t; -*-

(use-package gptel
  :ensure t
  :config
  (gptel-make-ollama "Ollama"
	:host "localhost:11434"
	:stream t
	:models '(llama3:8b))
  )

(provide 'init-llm)
