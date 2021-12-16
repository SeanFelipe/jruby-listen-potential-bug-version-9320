# jruby-listen-potential-bug-version-9320
demo for potential bug with listen and JRuby 9.3.2.0


I believe there's a bug with listen and 9.3.x versions of JRuby. Somehow listen isn't noticing file modifications, whereas this was happening with 9.2.x . This repo demos the bug using a stripped down game loop from the java gaming library LibGDX. There are different branches with different JRuby versions configured, via RVM with the `.ruby-version` file.

### steps to reproduce (master branch)

```
./r
```

or

```
export JAVACMD=$JAVA_HOME/bin/java && cd src && jruby desktop.rb
```

A blank game screen should spawn. Now, edit `src/zredc.rb` and change the base value in the render method:

```
  def render
    #puts "zredc#render"
    base = 0.1
    Gdx::gl::gl_clear_color(base, base, base, 1)
    Gdx::gl::gl_clear(GL20::GL_COLOR_BUFFER_BIT)
  end
```

Monitoring stdout from your running game loop, there are no modifications noted. Quit / control-C the game, restart, and you should see the background color has changed.


### intended behavior (jruby-92 branch)

Repeat the steps from above. When you modify the zredc.rb file, you should see a modification notice from listen:

```
08:52 $ r
starting listener...
listener initialized
libgdx version: 1.9.5
modified: ["/Users/felipe/scratchpad/stacktrace-jruby-26N1/src/zredc.rb"]
file modified: ["/Users/felipe/scratchpad/stacktrace-jruby-26N1/src/zredc.rb"]
```

Hopefully this is a good writeup !!! Let me know what further information is helpful !!

