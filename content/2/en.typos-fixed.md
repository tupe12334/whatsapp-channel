# Building packages and open source

While I had worked on this channel I had encountered a small issue: there is no CLI tool that can convert my markdown files that I write in English (it's easier for me :P) to the WhatsApp supported format. I asked ChatGPT to find me one and it failed to do so.

So what have I done? I built one, and let me clarify, when I'm saying "I" I mean "we" — who is we? Me and Claude Code, my best friend.

I started by making sure manually that there is no such tool indeed. Then I started a new repository and initialized Centy (my issue management tool of choice — yes, I do not use GitHub for issue management, I will write about it later).

After defining the tool and what I expect it to do: <https://github.com/tupe12334/md-to-whatsapp/blob/main/.centy/issues/15348787-7f41-4e20-8c0f-33b52cf0d1e8/issue.md>

I instructed Claude Code to start working on it. Yes, as simple as that.

And this is what I think most channels are missing. The AI and LLMs are tools; they didn't come to replace us (at least not yet). The power to provide a tested, documented, well-written lib and CLI took me around 30 minutes of work, while in the meantime I had actually opened an issue report for the Roo Code project <https://github.com/RooCodeInc/Roo-Code/issues/10277>, and wrote this article.

This is the power that we, as the developers of the future, should embrace — not replacing our mind with AI, but increasing our hands with it.

The tool discussed can be found here:

- https://www.npmjs.com/package/md-to-whatsapp
- https://www.npmjs.com/package/centy
