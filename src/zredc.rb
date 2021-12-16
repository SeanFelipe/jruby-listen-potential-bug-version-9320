class MainGame < ApplicationAdapter
  def create
    puts("libgdx version: #{com::badlogic::gdx::Version::VERSION}")
    Gdx::graphics::setContinuousRendering(false)
    $ww, $hh = Gdx::graphics::getWidth, Gdx::graphics::getHeight
  end

  def render
    #puts "zredc#render"
    base = 0.1
    Gdx::gl::gl_clear_color(base, base, base, 1)
    Gdx::gl::gl_clear(GL20::GL_COLOR_BUFFER_BIT)
  end
end
