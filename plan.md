Below is the detailed plan for implementing the Chat PPT application:

---

### 1. Create the Chat Page  
**File:** `src/app/chat/page.tsx`  
- **Purpose:** Acts as the main view for Chat PPT.  
- **Changes/Steps:**  
  - Create a new file (`page.tsx`) under `src/app/chat/` (create the folder if needed).  
  - Import existing UI components (e.g., Card, Button, Input) and new components (ChatMessageList, ChatForm, ApiKeyInput).  
  - Structure the page into three sections:  
    - A header with the title “Chat PPT”.  
    - A scrollable container for messages using the `ChatMessageList` component.  
    - A fixed footer containing the `ChatForm` for sending messages.  
  - Conditionally display the `ApiKeyInput` (if no API key is stored).  
  - Use Tailwind CSS to ensure modern typography, spacing, and a minimalistic look.

---

### 2. Chat Message List Component  
**File:** `src/components/ChatMessageList.tsx`  
- **Purpose:** Renders a vertical list of messages using a clean card-based layout.  
- **Changes/Steps:**  
  - Create this new component that accepts a prop (e.g. an array of message objects with fields: role and content).  
  - For each message, use a Card layout and apply different alignment and background styling (user messages on the right, AI messages on the left).  
  - Ensure the container is scrollable with smooth overflow handling and proper padding.

---

### 3. Chat Form Component  
**File:** `src/components/ChatForm.tsx`  
- **Purpose:** Provides an input field and send button to enable message submission.  
- **Changes/Steps:**  
  - Create a new component that uses the shadcn/ui `Input` and `Button` components.  
  - Manage local state for the input; disable the button while awaiting a response.  
  - On submission, execute a callback (passed via props) to send the user message to the API and update the message list.
  - Add error handling to ensure empty messages are not sent.

---

### 4. API Key Input Component  
**File:** `src/components/ApiKeyInput.tsx`  
- **Purpose:** Lets the user paste and store their API key for AI responses.  
- **Changes/Steps:**  
  - Create this component with an input field and save button.  
  - Use a local storage hook (see next step) to persist the key.  
  - Validate input and provide an inline error message if the key is empty.

---

### 5. Local Storage Hook  
**File:** `src/hooks/useLocalStorage.ts`  
- **Purpose:** Manages saving and retrieving values (like the API key) from the browser’s localStorage.  
- **Changes/Steps:**  
  - Implement a custom hook that accepts a key and default value.  
  - The hook returns the state value and an updater function.  
  - Use try/catch to handle errors (e.g. storage unavailable).

---

### 6. Chat API Route  
**File:** `src/app/api/chat/route.ts`  
- **Purpose:** Acts as the backend endpoint for processing chat requests.  
- **Changes/Steps:**  
  - Create a new Next.js App Router API route under `src/app/api/chat/` with a `POST` method.  
  - Parse the request body for messages and extract the user message.  
  - Retrieve the API key (passed by the client, ideally via header or body) and respond with a 400 error if missing.  
  - Forward the request to the AI provider using the OpenRouter endpoint:  
    - Endpoint: `https://openrouter.ai/api/v1/chat/completions`  
    - Model: use the default `anthropic/claude-sonnet-4` unless specified otherwise.  
  - Use async/await and proper try/catch error handling to return a JSON response with the AI-generated message.
  
---

### 7. Integration & UI/UX Considerations  
- **Feature Details:**  
  - The chat interface will simulate a conversation: once a user sends a message, the UI immediately adds it to the message list. An API call is then made, and upon response, the AI message is appended.  
  - If the API call fails, a clear inline error is displayed in the chat window.  
  - Styling is kept modern using Tailwind typography, spacing, and rounded corners, with no external icon libraries.
- **API Integration:**  
  - Use real HTTP calls from the Chat Form to the API route.  
  - Validate responses with curl testing to ensure correct status codes and response times.

---

### 8. Error Handling & Best Practices  
- Validate that the API key is provided (both on the API route and in the UI).  
- Use try/catch blocks in the API route to handle network or response errors gracefully.  
- Disable UI elements during asynchronous operations to prevent duplicate calls.  
- Maintain clear separation of concerns with dedicated components and hooks.

---

### Summary  
- A new chat page (`src/app/chat/page.tsx`) is created with header, message list, and input form.  
- The `ChatMessageList` and `ChatForm` components display conversations and manage input, respectively.  
- An `ApiKeyInput` component (using a custom `useLocalStorage` hook) lets users store their API key.  
- An API route (`src/app/api/chat/route.ts`) interfaces with OpenRouter using the `anthropic/claude-sonnet-4` model.  
- Extensive error handling and modern UI practices (responsive design, proper spacing, and typography) are applied.  
- API key validation and asynchronous request management are built in for production-level reliability.  
- The solution adheres strictly to the required UI style guidelines without external icon libraries.
