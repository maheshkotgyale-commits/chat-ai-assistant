# Chat PPT - AI Assistant Application

A modern, ChatGPT-like AI assistant application built with Next.js, TypeScript, and Tailwind CSS.

## Features

- **Clean, Modern UI** - Minimalist design with black and white color scheme
- **Multiple AI Providers** - Supports OpenRouter, OpenAI, and Anthropic APIs
- **Local Storage** - API keys are stored securely in your browser
- **Real-time Chat** - Instant messaging with AI responses
- **Error Handling** - Comprehensive error handling and user feedback
- **Responsive Design** - Works perfectly on all device sizes
- **Message History** - Persistent chat history during your session

## Getting Started

### Prerequisites

- Node.js 18+ installed
- An API key from one of the supported providers:
  - **OpenRouter** (recommended) - Get free credits at [openrouter.ai](https://openrouter.ai)
  - **OpenAI** - Get your key at [platform.openai.com](https://platform.openai.com)
  - **Anthropic** - Get your key at [console.anthropic.com](https://console.anthropic.com)

### Installation

1. Clone or download this project
2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the development server:
   ```bash
   npm run dev
   ```

4. Open [http://localhost:8000](http://localhost:8000) in your browser

### Usage

1. **Enter API Key**: When you first open the app, enter your API key from one of the supported providers
2. **Start Chatting**: Type your message in the input field and press Send
3. **View Responses**: AI responses will appear in the chat interface
4. **Clear Chat**: Use the "Clear Chat" button to start a new conversation

## API Endpoints

### POST /api/chat

Processes chat messages and returns AI responses.

**Request Body:**
```json
{
  "messages": [
    {
      "role": "user",
      "content": "Your message here"
    }
  ],
  "apiKey": "your-api-key"
}
```

**Response:**
```json
{
  "message": "AI response here"
}
```

**Error Responses:**
- `400` - Missing API key or messages
- `401` - Invalid API key
- `500` - Internal server error

## Technology Stack

- **Framework**: Next.js 15 with App Router
- **Language**: TypeScript
- **Styling**: Tailwind CSS
- **UI Components**: shadcn/ui
- **State Management**: React hooks with localStorage
- **API Integration**: Multiple AI providers (OpenRouter, OpenAI, Anthropic)

## Project Structure

```
src/
├── app/
│   ├── api/chat/route.ts     # Chat API endpoint
│   ├── layout.tsx            # Root layout
│   ├── page.tsx              # Main chat page
│   └── globals.css           # Global styles
├── components/
│   ├── ui/                   # shadcn/ui components
│   ├── ApiKeyInput.tsx       # API key input component
│   ├── ChatForm.tsx          # Message input form
│   └── ChatMessageList.tsx   # Message display component
└── hooks/
    └── useLocalStorage.ts    # Local storage hook
```

## Features in Detail

### API Key Management
- Secure local storage of API keys
- Support for multiple AI providers
- Automatic provider detection and fallback

### Chat Interface
- Real-time message display
- User messages on the right (dark theme)
- AI responses on the left (light theme)
- Timestamps for all messages
- Loading indicators during AI processing

### Error Handling
- Network error handling
- API key validation
- User-friendly error messages
- Graceful fallbacks

## Security

- API keys are stored locally in your browser only
- Keys are never sent to our servers except for AI API calls
- All communication uses HTTPS in production

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is open source and available under the MIT License.
