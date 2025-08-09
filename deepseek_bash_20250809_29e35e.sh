curl https://openrouter.ai/api/v1/chat/completions \
  -H "Authorization: Bearer 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" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "openai/gpt-3.5-turbo",
    "messages": [{"role": "user", "content": "Hello, who are you?"}]
  }'