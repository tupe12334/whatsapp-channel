# Working with N-API and Rust

After finishing the implementation of the `md-to-whatsapp` lib that I had created, I wanted to test out a theory of mine: what if we implement the logic of this lib in **RUST**?
I dived into the world of **N-API** and got out of the water with interesting results and food for thought.

I want to share the benchmark results. Take into consideration that this is a very basic and simple library; the only goal is to convert markdown to WhatsApp formatted text.

<https://github.com/tupe12334/md-to-whatsapp/blob/main/BENCHMARKS.md>

In a nutshell, the Rust implementation was around **2x** faster than the original TypeScript implementation.
And even more than that, the Rust implementation provides us with a much better code implementation. The beauty of Rust is that it forces you to write good code that manages all the optional use cases via its pattern matching and type system.

I will write much more about this in the future, but for now, it's important for you to understand that by using Rust via the N-API, we're providing "perfect" code. The only bugs that we can encounter are not memory or unmanaged state bugs, but rather "product" bugs only.

I would like to hear your thoughts about this approach and your two cents about it.
