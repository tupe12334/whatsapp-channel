# Working with N-API and Rust

After finishing the implementation of the `md-to-whatsapp` lib that i had created. I wanted to test out a theory of mine, what if we will implement the logic of this lib in **RUST**?
I dived into the world of **N-API** and got out of the water with interesting results and food for thought.

I want to share the benchmarks results, take into consideration that this is a very basic and simple library, the only goal is to convert markdown to WhatsApp formatted text.

<https://github.com/tupe12334/md-to-whatsapp/blob/main/BENCHMARKS.md>

In a nutshell, the Rust implementation was around **2x** faster than the original Typescript implementation.
And even more then that, the rust implementation provide us with a much better code implementation, the beauty around Rust is that it forces you to write good code that is managing all the optional use-cases via its pattern matching and type system.

I will write much more about this in the future, but for now, its important for you to understand, by using Rust via the N-API we providing a "perfect" code, the only bugs that we can encounter are not memory or unmanaged state bugs, but rather "product" bugs only.

I would to hear your thought about this approach and your two cents about it.
