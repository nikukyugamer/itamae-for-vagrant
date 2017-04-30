# What's this?
[Itamae](http://itamae.kitchen/) codes for provisioning `rbenv` minimum environment

# How to use
1. rewrite and rename below files as your environment
- `sabaku.sh.sample` to `sabaku.sh`
- `cookbooks\secret\username_and_password.rb.sample` to `cookbooks\secret\username_and_password.rb`
- `cookbooks\secret\root_password.rb.sample` to `cookbooks\secret\root_password.rb`
- `cookbooks\secret\authorized_keys.sample` to `authorized_keys.sample`

2. add exec permission `sabaku.sh`
3. exec `sabaku.sh` as below

```bash
$ ./sabaku.sh
```

4. you need to input password three times
    - `sudo` password
    - first user's ssh password
    - second user's ssh password
5. wait a minute
6. provisioning is complete, it's ready!

# Notes
- these recipes are useful **FOR ME** so you should modify them you like.
- some recipes aren't used
- I cannot use `git` such as below

```ruby
git "/usr/local/rbenv" do
  repository "git://github.com/rbenv/rbenv.git"
end
```

```bash
stdout | fatal: Not a git repository (or any of the parent directories): .git
```

- should use not relative pathname but absolute pathname
    - doesn't work well when relative pathname 
    - absolute pathname is idempotent and easy to understand
- not `adduser` command but `useradd` command
    - `adduser` command is recommended on Ubuntu 
    - but unwritable only one-linear with `adduser` command
    - so add `CREATE_HOME yes` in `login.defs` and used `useradd` command 

# Tips
- `sabaku` of `sabaku.sh` is Japanese verb word `捌く(Sa-Ba-Ku)`, which means `to deal with foodstuff well`
    - [example image](http://livedoor.blogimg.jp/maamee123/imgs/b/f/bf9923eb.jpg)

# Thanks
- [Best Practice · itamae-kitchen/itamae Wiki](https://github.com/itamae-kitchen/itamae/wiki/Best-Practice)
- [Chef脱落者が、Itamaeで快適インフラ生活する話](http://qiita.com/zaru/items/8ae6182e544aac6f6d79)
- [Itamaeチートシート](http://qiita.com/fukuiretu/items/170aa956731f2ffb5715)

# LICENSE
- [MIT License](/LICENSE)
