require 'cryptopunks'


### generate 4x versions

['human1',
 'human2',
 'human3',
 'human4',
 'zombie',
 'ape',
 'alien'].each do |name|

  path = "./i/attributes/#{name}_round.png"
  punk = Image.read( path )

  punk.zoom(4).save( "./i/#{name}_round@4x.png" )
end




ALIEN_ROUND  = Image.read( './i/attributes/alien_round.png' )
APE_ROUND    = Image.read( './i/attributes/ape_round.png' )
ZOMBIE_ROUND  = Image.read( './i/attributes/zombie_round.png' )

CRAZY_HAIR_II = Image.read( './i/attributes/crazyhair_ii.png' )
WILD_HAIR_II  = Image.read( './i/attributes/wildhair_ii.png' )


ALIEN        = Punks::Sheet.find_by( name: 'Alien' )
APE          = Punks::Sheet.find_by( name: 'Ape' )
ZOMBIE       = Punks::Sheet.find_by( name: 'Zombie' )

CAP_FORWARD  = Punks::Sheet.find_by( name: 'Cap Forward', gender: 'm' )
PIPE         = Punks::Sheet.find_by( name: 'Pipe', gender: 'm' )
SMALL_SHADES = Punks::Sheet.find_by( name: 'Small Shades', gender: 'm' )
HEADBAND     = Punks::Sheet.find_by( name: 'Headband', gender: 'm' )
KNITTED_CAP  = Punks::Sheet.find_by( name: 'Knitted Cap', gender: 'm' )
CRAZY_HAIR   = Punks::Sheet.find_by( name: 'Crazy Hair', gender: 'm' )
CHINSTRAP    = Punks::Sheet.find_by( name: 'Chinstrap', gender: 'm' )
EARRING      = Punks::Sheet.find_by( name: 'Earring', gender: 'm' )
WILD_HAIR    = Punks::Sheet.find_by( name: 'Wild Hair', gender: 'm' )
_3D_GLASSES  = Punks::Sheet.find_by( name: '3D Glasses', gender: 'm' )


### note: special case for neckware (differs for "classic" and "round")
GOLD_CHAIN    = Punks::Sheet.find_by( name: 'Gold Chain', gender: 'm' )
GOLD_CHAIN_II = Punks::Sheet.find_by( name: 'Gold Chain', gender: 'f' )



### try (alien) punk #7804  - "mr mona lisa"
##   with attributes
##  - Cap Forward
##  - Pipe
##  - Small Shades
punk = Image.new( 24, 24 )
punk.compose!( ALIEN )
punk.compose!( CAP_FORWARD )
punk.compose!( SMALL_SHADES )
punk.compose!( PIPE )
punk.zoom(4).save( "./i/punk7804@4x.png")

punk = Image.new( 24, 24 )
punk.compose!( ALIEN_ROUND )
punk.compose!( CAP_FORWARD )
punk.compose!( SMALL_SHADES )
punk.compose!( PIPE )
punk.zoom(4).save( "./i/punkette7804@4x.png")

### try (alien) punk #3100
##   with attributes
##   - Headband
punk = Image.new( 24, 24 )
punk.compose!( ALIEN )
punk.compose!( HEADBAND )
punk.zoom(4).save( "./i/punk3100@4x.png")

punk = Image.new( 24, 24 )
punk.compose!( ALIEN_ROUND )
punk.compose!( HEADBAND )
punk.zoom(4).save( "./i/punkette3100@4x.png")


#### try (ape) punk #5217
##   with attributes
##    - Gold Chain
##    - Knitted Cap
punk = Image.new( 24, 24 )
punk.compose!( APE )
punk.compose!( GOLD_CHAIN )
punk.compose!( KNITTED_CAP )
punk.zoom(4).save( "./i/punk5217@4x.png")

punk = Image.new( 24, 24 )
punk.compose!( APE_ROUND )
punk.compose!( GOLD_CHAIN_II )
punk.compose!( KNITTED_CAP )
punk.zoom(4).save( "./i/punkette5217@4x.png")


#### try (zombie) punk #7252
##   with attributes
##   - Crazy Hair
##   - Chinstrap
##   - Earring
punk = Image.new( 24, 24 )
punk.compose!( ZOMBIE )
punk.compose!( CRAZY_HAIR )
punk.compose!( CHINSTRAP )
punk.compose!( EARRING )
punk.zoom(4).save( "./i/punk7252@4x.png")

punk = Image.new( 24, 24 )
punk.compose!( ZOMBIE_ROUND )
punk.compose!( CRAZY_HAIR_II )
punk.compose!( EARRING )
punk.zoom(4).save( "./i/punkette7252@4x.png")


#### try (zombie) punk #8857
##   with attributes
##     - Wild Hair
##     - 3D Glasses
punk = Image.new( 24, 24 )
punk.compose!( ZOMBIE )
punk.compose!( WILD_HAIR )
punk.compose!( _3D_GLASSES )
punk.zoom(4).save( "./i/punk8857@4x.png")

punk = Image.new( 24, 24 )
punk.compose!( ZOMBIE_ROUND )
punk.compose!( WILD_HAIR_II )
punk.compose!( _3D_GLASSES )
punk.zoom(4).save( "./i/punkette8857@4x.png")


puts "bye"