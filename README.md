# 🚀 Agentuity Agents Showroom - Contribution Guide 🌟

Want to feature your agent in the [Agentuity Showroom](https://agentuity.com/showroom)? You're in the right place! 🤖

Just create a pull request with your agent's `.mdx` file to get started.

Since you're here, you're already part of the community! 🎉 **You're officially invited to join our [Discord](https://discord.gg/agentuity)** and follow us on [YouTube](https://www.youtube.com/@Agentuity), [X](https://x.com/agentuity), and [LinkedIn](https://www.linkedin.com/company/agentuity).

## How to Feature Your Agent

### 1. Create Your Agent File

Create a new file in the `agents-showroom/exhibit/` directory named `[your-agent-name].mdx`

### 2. Add the Required Metadata

Your agent file must start with the metadata export in this exact format:

```typescript
export const metadata = {
  title: 'Your Agent Name',
  description: 'Brief description of what your agent does',
  imageURL: '/showroom-exhibit-image/image-name.png', // optional - can also add external like: 'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?auto=format&fit=crop&w=600&q=80' 
  date: '2025-01-15', // Today's date
  lastUpdatedDate: '2025-01-15', // Today's date
  authorData: {
    showroomCardName: 'Your Name',
    isCommunity: true,
    exhibitAuthorName: 'Your Name', // optional
    exhibitAuthorLink: 'https://github.com/yourusername', // optional
  },
  links: {
    repository: 'https://github.com/yourusername/your-agent',
    blog: 'https://yourblog.com/post', // optional
    video: 'https://youtube.com/watch?v=...', // optional
  },
  tags: ['python', 'langchain', 'automation', 'productivity'], // Be specific!
};
```

### 3. Write Your Agent Introduction (feel free to see the other examples here)

After the metadata, write a cool introduction to your agent using MDX. This should include:

- What your agent does
- How to use it
- Key features

### 4. Submit Your Pull Request

1. Fork the `agents-showroom` repository
2. Add your `[agent-name].mdx` file to the `exhibit/` directory
3. Submit a pull request with your agent

### 5. Go Live

Once your PR is approved, your agent will appear on [agentuity.com/showroom](https://agentuity.com/showroom) within **48 hours** automatically!

## What Makes a Great Contribution

### ✅ Do This

- **Follow the metadata format** and fill it out completely (optional fields are optional 😉)
- **Write a cool agent** or agent starting point/template
- **Write a short, engaging introduction** that explains what your agent does
- **Add relevant tags** (frameworks, tools, technologies, use cases, etc.)
- **Use clean, professional images** without watermarks
- **Image absolute path** For the `imageURL`, use an absolute path like `/showroom-exhibit-image/your-image.png` or an external image URL (`https://...`)
- **Include working code examples** and clear instructions
- **Link to your actual repository** with the agent code

### ❌ Don't Do This

- Add inappropriate content (links, images, or text)
- Use watermarked or copyrighted images
- Submit broken or incomplete agents
- Skip the required metadata fields
- Write overly long descriptions (keep it concise!)

Ready to showcase your agent? Create that PR and join the showroom! 🚀

## Come Say Hi! 👋

The Agentuity team is available and accessible on our Discord. We'd love for you to say hi, ask questions, or even hop on our community calls.

Join the conversation on **[Discord](https://discord.gg/agentuity)**!
