;; -*- lexical-binding: t; -*-

(use-package gptel
  :ensure t
  :commands (gptel gptel-menu gptel-send)
  :config
  (gptel-make-ollama "Ollama"
	:host "localhost:11434"
	:stream t
	:models '(llama3:8b))
  )

(provide 'init-llm)
