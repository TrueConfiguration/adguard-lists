# adguard-lists

Personal lists for [AdGuardHome](https://github.com/AdguardTeam/AdGuardHome), in adguard/ABP format.
Will probably work in other DNS based blocking software with some formatting.

This comes from various sources, that I collected through years scrolling trhough reddit, forums, discourses and other communities, so its nigh impossible to put all the authors here.

Also contains domains that I collected from my own experience.
I'm certain that except from some very specific cases, most of these will already be included in the major blacklists out there, but I keep them just in case.

## About the folders and files

- [`hostlist-compiler/`](./hostlist-compiler/): contains hostlists from other authors, recompiled in the [AdGuard flavored ABP Syntax](https://adguard.com/kb/general/ad-filtering/create-own-filters/), and the scripts to do the job. It uses the [Adguard Team's Hostlist Compiler utility](https://github.com/AdguardTeam/HostlistCompiler).
    - [`compile.sh`](./hostlist-compiler/compile.sh): calls the hostlist-compiler from the NPM path to fetch and compile the lists to the destination folder.
    - [`push.sh`](./hostlist-compiler/push.sh): syncs the new files to this repo.
    - [`configs/`](./hostlist-compiler/configs/): is where the config files for each source is stored, to be used by the hostlist-compiler application.
    - [`compiled/`](./hostlist-compiler/compiled/): is the destination folder, where the compiled lists are stored and made available to use in AGH.
    - `temp/`: the compile script will create a temp folder (if it doesn't already exists) where to store downloaded lists before comparing to the already compiled lists. This is because I run this script daily for updates, but don't want to push unless there are changes to the lists, and the hostlist-compiler lacks a native comparison function. The contents of this folder will **not** be pushed to git.
- [`blacklist.txt`](./blacklist-regex.txt) and [`blacklist-regex.txt`](./blacklist-regex.txt): contains the domains that I collected and compiled myself or got from forums/discourses, Discord, other lists and servers etc. and use on my AGH instance. Credit for each (where possible) is in the file's comments.
- [`whitelist.txt`](./whitelist.txt) and [`whitelist-regex.txt`](./whitelist-regex.txt): contains the domains that I found that broke important things in my day-to-day use. Also has lists I got from various sources, as described above, credits in the comments.
- [`filter-list-blacklist.txt`](./filter-list-blacklists.txt) and [`filter-list-whitelist.txt`](./filter-list-whitelists.txt): contains the source lists that I use in my AGH.
- [`ip-blacklist.txt`](./ip-blacklist.txt): List of blacklisted IP Addresses. Will not work with AGH or Pi-hole, it's designed to be used with firewall software, to deny connections to telemetry and other spyware that does not rely on DNS.

---

## Disclaimer

> This lists are provided *as-is*, and are designed with my personal use and preferences in mind, and WILL break some internet services, because I'm ok with sacrificing some convenience for privacy/safety. I also experiment a lot with these lists, so things will break from time to time until I figure out what and why is broken and fix it. 
>
> Therefore in no event shall this list, or the list author be liable for any indirect, direct, punitive, special, incidental, or consequential damages whatsoever. By downloading or viewing, or using this list, you are accepting these terms and the license.