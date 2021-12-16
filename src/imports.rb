jardir =  "#{Dir.pwd}/../libs"
gdx_jars = [
  'gdx.jar',
  'gdx-natives.jar',
]
gdx_jars.each {|j| require "#{jardir}/#{j}"}

desktop_jardir = "../libs/desktop-libs"
desktop_jars = [
  'gdx-backend-lwjgl.jar',
  'gdx-backend-lwjgl-natives.jar',
]
desktop_jars.each {|j| require "#{desktop_jardir}/#{j}"}
desktop_imports = [
  'backends.lwjgl.LwjglApplication',
  'backends.lwjgl.LwjglApplicationConfiguration',
]

desktop_imports.each do |i|
  java_import "com.badlogic.gdx.#{i}"
end

# everything else
imports = [
  'ApplicationAdapter',
  'ApplicationListener',
  'Input',
  'InputAdapter',
  'InputMultiplexer',
  'InputProcessor',
  'Game',
  'Gdx',
  #'ScreenAdapter',
  'graphics.GL20',
  #'graphics.Mesh',

]

imports.each do |i|
  java_import "com.badlogic.gdx.#{i}"
end

# use GdxArray so we don't wallpaper the JRuby Array class
GdxArray = com::badlogic::gdx::utils::Array
