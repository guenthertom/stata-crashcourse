# Wrap-up & Resources

Congratulations on completing the Stata crash course! You are now able to start your empirical projects. Of course, we couldn’t cover everything here—when you run into new questions, these resources will help.

## 🔍 Further learning

- Stata’s official [documentation](https://www.stata.com/documentation/) and *help* files cover most tasks and errors.
- [Microeconometrics Using Stata (2nd ed.)](https://www.stata.com/bookstore/microeconometrics-stata/) by Cameron & Trivedi is an excellent textbook companion.
- Community Q&A: [Statalist](https://www.statalist.org/); [r/stata](https://www.reddit.com/r/stata/); [Cross Validated (stats, Stack Exchange)](https://stats.stackexchange.com/); [Stack Overflow](https://stackoverflow.com/); ...

## 📚 Templates

Feel free to use the following templates for your projects:

- [header.do](header.do) is best used for projects under single-authorship.
- If you work with other people on the same data, you may want to use the extended [header_collaboration.do](header_collaboration.do).
- You can nest do-files, i.e., you can call a do-file from within another do-file. The [master.do](master.do) makes use of this by creating a hub for your project. Each analysis step will get its own do-file. All do-files are called from the master.

Make sure to implement the folder structure implied by the pathing in these templates.

## 📝 Feedback & citation

If you found bugs or have requests, open an issue or send a note. <br>
If you cite this material, please use:

Günther, Tom (2025). Stata Crash Course. URL: <https://guenthertom.github.io/stata-crashcourse/>.

<span style="display:block; margin-top:4em;"></span>