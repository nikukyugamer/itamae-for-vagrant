# What's this?
[Itamae](http://itamae.kitchen/) codes for provisioning `rbenv` minimum environment
- assumed on Vagrant environment
    - sample Vagrantfile is [here](https://gist.github.com/corselia/60111eb1303717035f3c17ef3502bbb4)

# How to use
1. rewrite and rename below files as your environment
- `sabaku.sh.sample` to `sabaku.sh`
    - `user_01` and `user_02` need to be changed
        - `user_01` will be Vagrant default user
        - `user_02` will be general user you wanna add
- `cookbooks\secret\username_and_password.rb.sample` to `cookbooks\secret\username_and_password.rb`
    - `USERNAME` is very above `user_02`
    - `PASSWORD` is `USERNAME`'s password
- `cookbooks\secret\root_password.rb.sample` to `cookbooks\secret\root_password.rb`
    - `ROOT_PASSWORD` is root user's password
    - note that root login with password is prohibited
- `cookbooks\secret\authorized_keys.sample` to `authorized_keys.sample`
    - you must prepare pair of public key and secret key
2. add exec permission `sabaku.sh`
3. exec `sabaku.sh` as below

```bash
$ ./sabaku.sh
```

4. you need to input password three times
    - `sudo` password
    - first user's ssh password
        - `first user` is Vagrant default user
    - second user's ssh password
        - `second user` is general user you wanna add
5. please wait a minute
6. provisioning is complete, it's ready to use!

# Notes
- these recipes are useful **FOR ME** so you should modify them you like.
- some recipes aren't used
- I cannot use `git` such as below...why?

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
