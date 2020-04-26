{
  actioncable = {
    dependencies = ["actionpack" "nio4r" "websocket-driver"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1kck3ayzm0l7rj8066iy1hlvg5p9mf6xfyjs6n53v7qfcwmhn5xj";
      type = "gem";
    };
    version = "6.0.2.2";
  };
  actionmailbox = {
    dependencies = ["actionpack" "activejob" "activerecord" "activestorage" "activesupport" "mail"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gi20m7z66fagd29yy6855nbn08w6pdsv2bhaiff8g885fxx9xn5";
      type = "gem";
    };
    version = "6.0.2.2";
  };
  actionmailer = {
    dependencies = ["actionpack" "actionview" "activejob" "mail" "rails-dom-testing"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0kzqkpmknwsm2bwipyf32lqjdfgbxrvyhm7p17rczxdhjk9agwms";
      type = "gem";
    };
    version = "6.0.2.2";
  };
  actionpack = {
    dependencies = ["actionview" "activesupport" "rack" "rack-test" "rails-dom-testing" "rails-html-sanitizer"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0p72ipb1ip01f96yffrs4hwgpwv7ka5a9hd1m3afa55hhr1z1h2q";
      type = "gem";
    };
    version = "6.0.2.2";
  };
  actiontext = {
    dependencies = ["actionpack" "activerecord" "activestorage" "activesupport" "nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ngy2zcih99nmv6yhpkyljr1l0zs7kkv5r0722fslkkrg4dv8bw7";
      type = "gem";
    };
    version = "6.0.2.2";
  };
  actionview = {
    dependencies = ["activesupport" "builder" "erubi" "rails-dom-testing" "rails-html-sanitizer"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "05vipmv2xd51fkc2a5zli3zavnzjriy180jhv1fiv5pny3islhsy";
      type = "gem";
    };
    version = "6.0.2.2";
  };
  activejob = {
    dependencies = ["activesupport" "globalid"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1qrz9c6kg3jm48zrb7ngyqxy6j2mfcdi9gvdwn65scvfsbpiblky";
      type = "gem";
    };
    version = "6.0.2.2";
  };
  activemodel = {
    dependencies = ["activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1kcr5zhs9s42pbz1yqw2r0g6nifcbyvw7iq9fza8a734lxw9jm9m";
      type = "gem";
    };
    version = "6.0.2.2";
  };
  activerecord = {
    dependencies = ["activemodel" "activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "101w040dq7kisr92p7w3c4mxik63n57m3cn306csq6cxz8nawsjc";
      type = "gem";
    };
    version = "6.0.2.2";
  };
  activestorage = {
    dependencies = ["actionpack" "activejob" "activerecord" "marcel"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0pkic3xnsr1vf5h670zlk76spd73k7qgx2fxkc0dyn2ydh2nb341";
      type = "gem";
    };
    version = "6.0.2.2";
  };
  activesupport = {
    dependencies = ["concurrent-ruby" "i18n" "minitest" "tzinfo" "zeitwerk"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1md98dkbirc8mq5nbz1vqq3hwqjiv7b54q7180w8wyxgd4k1awwb";
      type = "gem";
    };
    version = "6.0.2.2";
  };
  bootsnap = {
    dependencies = ["msgpack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bz62p9vc7lcrmzhiz4pf7myww086mq287cw3jjj7fyc7jhmamw0";
      type = "gem";
    };
    version = "1.4.6";
  };
  builder = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "045wzckxpwcqzrjr353cxnyaxgf0qg22jh00dcx7z38cys5g1jlr";
      type = "gem";
    };
    version = "3.2.4";
  };
  byebug = {
    groups = ["development" "test"];
    platforms = [{
      engine = "maglev";
    } {
      engine = "mingw";
    } {
      engine = "mingw";
    } {
      engine = "ruby";
    }];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nx3yjf4xzdgb8jkmk2344081gqr22pgjqnmjg2q64mj5d6r9194";
      type = "gem";
    };
    version = "11.1.3";
  };
  concurrent-ruby = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "094387x4yasb797mv07cs3g6f08y56virc2rjcpb1k79rzaj3nhl";
      type = "gem";
    };
    version = "1.1.6";
  };
  crass = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0pfl5c0pyqaparxaqxi6s4gfl21bdldwiawrc0aknyvflli60lfw";
      type = "gem";
    };
    version = "1.0.6";
  };
  erubi = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nwzxnqhr31fn7nbqmffcysvxjdfl3bhxi0bld5qqhcnfc1xd13x";
      type = "gem";
    };
    version = "1.9.0";
  };
  faker = {
    dependencies = ["i18n"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bnki5018srm3f2kdkxvyhr4g4ffzm0b3jkbdsa98b3x5rq14v84";
      type = "gem";
    };
    version = "2.11.0";
  };
  ffi = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10lfhahnnc91v63xpvk65apn61pib086zha3z5sp1xk9acfx12h4";
      type = "gem";
    };
    version = "1.12.2";
  };
  globalid = {
    dependencies = ["activesupport"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1zkxndvck72bfw235bd9nl2ii0lvs5z88q14706cmn702ww2mxv1";
      type = "gem";
    };
    version = "0.4.2";
  };
  i18n = {
    dependencies = ["concurrent-ruby"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jwrd1l4mxz06iyx6053lr6hz2zy7ah2k3ranfzisvych5q19kwm";
      type = "gem";
    };
    version = "1.8.2";
  };
  listen = {
    dependencies = ["rb-fsevent" "rb-inotify"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1w923wmdi3gyiky0asqdw5dnh3gcjs2xyn82ajvjfjwh6sn0clgi";
      type = "gem";
    };
    version = "3.2.1";
  };
  loofah = {
    dependencies = ["crass" "nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jk9fgn5ayzbqvzqm11gbkqvas77zdbpkvynlylyiwynclgrn040";
      type = "gem";
    };
    version = "2.5.0";
  };
  mail = {
    dependencies = ["mini_mime"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00wwz6ys0502dpk8xprwcqfwyf3hmnx6lgxaiq6vj43mkx43sapc";
      type = "gem";
    };
    version = "2.7.1";
  };
  marcel = {
    dependencies = ["mimemagic"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nxbjmcyg8vlw6zwagf17l9y2mwkagmmkg95xybpn4bmf3rfnksx";
      type = "gem";
    };
    version = "0.3.3";
  };
  method_source = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pnyh44qycnf9mzi1j6fywd5fkskv3x7nmsqrrws0rjn5dd4ayfp";
      type = "gem";
    };
    version = "1.0.0";
  };
  micromanage = {
    dependencies = ["rails"];
    groups = ["default"];
    platforms = [];
    source = {
      path = ../micromanage;
      type = "path";
    };
    version = "0.1.0";
  };
  mimemagic = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0frrfvz52fh4v1sb2xr9pyxhrxm5f7jppqxagpmd7c5ific66l9p";
      type = "gem";
    };
    version = "0.3.4";
  };
  mini_mime = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1axm0rxyx3ss93wbmfkm78a6x03l8y4qy60rhkkiq0aza0vwq3ha";
      type = "gem";
    };
    version = "1.0.2";
  };
  mini_portile2 = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15zplpfw3knqifj9bpf604rb3wc1vhq6363pd6lvhayng8wql5vy";
      type = "gem";
    };
    version = "2.4.0";
  };
  minitest = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0g73x65hmjph8dg1h3rkzfg7ys3ffxm35hj35grw75fixmq53qyz";
      type = "gem";
    };
    version = "5.14.0";
  };
  msgpack = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lva6bkvb4mfa0m3bqn4lm4s4gi81c40jvdcsrxr6vng49q9daih";
      type = "gem";
    };
    version = "1.3.3";
  };
  nio4r = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0gnmvbryr521r135yz5bv8354m7xn6miiapfgpg1bnwsvxz8xj6c";
      type = "gem";
    };
    version = "2.5.2";
  };
  nokogiri = {
    dependencies = ["mini_portile2"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12j76d0bp608932xkzmfi638c7aqah57l437q8494znzbj610qnm";
      type = "gem";
    };
    version = "1.10.9";
  };
  puma = {
    dependencies = ["nio4r"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0xwba5n3i17x8anfhk8w2wv5qzk8xlm6r7p2dj9v4lffb9in694f";
      type = "gem";
    };
    version = "4.3.3";
  };
  rack = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10mp9s48ssnw004aksq90gvhdvwczh8j6q82q2kqiqq92jd1zxbp";
      type = "gem";
    };
    version = "2.2.2";
  };
  rack-test = {
    dependencies = ["rack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rh8h376mx71ci5yklnpqqn118z3bl67nnv5k801qaqn1zs62h8m";
      type = "gem";
    };
    version = "1.1.0";
  };
  rails = {
    dependencies = ["actioncable" "actionmailbox" "actionmailer" "actionpack" "actiontext" "actionview" "activejob" "activemodel" "activerecord" "activestorage" "activesupport" "railties" "sprockets-rails"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "08n8l3y57f5sld9dv9gyix92nj2k0nirl5l54h1k7qa2v739sy2b";
      type = "gem";
    };
    version = "6.0.2.2";
  };
  rails-dom-testing = {
    dependencies = ["activesupport" "nokogiri"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lfq2a7kp2x64dzzi5p4cjcbiv62vxh9lyqk2f0rqq3fkzrw8h5i";
      type = "gem";
    };
    version = "2.0.3";
  };
  rails-html-sanitizer = {
    dependencies = ["loofah"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1icpqmxbppl4ynzmn6dx7wdil5hhq6fz707m9ya6d86c7ys8sd4f";
      type = "gem";
    };
    version = "1.3.0";
  };
  railties = {
    dependencies = ["actionpack" "activesupport" "method_source" "rake" "thor"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ccsddn69p6rng0nard1dx7qdimwwwqlvlmb383gbsach450v7av";
      type = "gem";
    };
    version = "6.0.2.2";
  };
  rake = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0w6qza25bq1s825faaglkx1k6d59aiyjjk3yw3ip5sb463mhhai9";
      type = "gem";
    };
    version = "13.0.1";
  };
  rb-fsevent = {
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1lm1k7wpz69jx7jrc92w3ggczkjyjbfziq5mg62vjnxmzs383xx8";
      type = "gem";
    };
    version = "0.10.3";
  };
  rb-inotify = {
    dependencies = ["ffi"];
    groups = ["default" "development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1jm76h8f8hji38z3ggf4bzi8vps6p7sagxn3ab57qc0xyga64005";
      type = "gem";
    };
    version = "0.10.1";
  };
  spring = {
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pqiqaqvxzb3mxg3c06l83dclms4ckxa0jbadhi93x3ybdjxcbyb";
      type = "gem";
    };
    version = "2.1.0";
  };
  spring-watcher-listen = {
    dependencies = ["listen" "spring"];
    groups = ["development"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ybz9nsngfz4psvgnbr3gdk5ibqqhq47lsjkwh5yq4f8brpr10yz";
      type = "gem";
    };
    version = "2.0.1";
  };
  sprockets = {
    dependencies = ["concurrent-ruby" "rack"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jm37zpvvm1arxjwrd6am0wrdbfhrhc5y0l4p2i3p11z04bsvgap";
      type = "gem";
    };
    version = "4.0.0";
  };
  sprockets-rails = {
    dependencies = ["actionpack" "activesupport" "sprockets"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0ab42pm8p5zxpv3sfraq45b9lj39cz9mrpdirm30vywzrwwkm5p1";
      type = "gem";
    };
    version = "3.2.1";
  };
  sqlite3 = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0lja01cp9xd5m6vmx99zwn4r7s97r1w5cb76gqd8xhbm1wxyzf78";
      type = "gem";
    };
    version = "1.4.2";
  };
  thor = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1xbhkmyhlxwzshaqa7swy2bx6vd64mm0wrr8g3jywvxy7hg0cwkm";
      type = "gem";
    };
    version = "1.0.1";
  };
  thread_safe = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0nmhcgq6cgz44srylra07bmaw99f5271l0dpsvl5f75m44l0gmwy";
      type = "gem";
    };
    version = "0.3.6";
  };
  tzinfo = {
    dependencies = ["thread_safe"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1i3jh086w1kbdj3k5l60lc3nwbanmzdf8yjj3mlrx9b2gjjxhi9r";
      type = "gem";
    };
    version = "1.2.7";
  };
  websocket-driver = {
    dependencies = ["websocket-extensions"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1bxamwqldmy98hxs5pqby3andws14hl36ch78g0s81gaz9b91nj2";
      type = "gem";
    };
    version = "0.7.1";
  };
  websocket-extensions = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "00i624ng1nvkz1yckj3f8yxxp6hi7xaqf40qh9q3hj2n1l9i8g6m";
      type = "gem";
    };
    version = "0.1.4";
  };
  zeitwerk = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1akpm3pwvyiack2zk6giv9yn3cqb8pw6g40p4394pdc3xmy3s4k0";
      type = "gem";
    };
    version = "2.3.0";
  };
}