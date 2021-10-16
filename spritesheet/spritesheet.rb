####################
#  assemble spritesheet (all-in-one composite image with attributes)

require 'pixelart'
require 'csvreader'



archetypes = CsvHash.read( "./archetypes.csv")
puts "  #{archetypes.size} record(s)"   #=> 64 records

attributes = CsvHash.read( "./attributes.csv")
puts "  #{attributes.size} record(s)"  #=> 133


total = archetypes.size + attributes.size

sheet = ImageComposite.new( 25, (total/25)+1 )


meta = []  ## output meta(data) records


####
#  add archetypes first


archetypes.each do |rec|
  path = rec['path']
  sheet << Image.read( "../../punks.blocks/#{path}" )


  name_i      = rec['name']
  names_ii    = (rec['name_ii'] || '').split( '|' )
  gender     = rec['gender']
  type       = rec['type']
  more_names = (rec['more_names'] || '').split( '|' )

  ## note: auto-add more names
  ##   1)  name_i + gender + name_ii        (e.g.   Human Male 1 | Human 1
  ##                                             or Human Female 1)
  ##   2)  name_i + name_ii + gender_symbol (e.g. Human 1 ♂    or Human 1 ♀)

  names = []

  if gender == 'm'
    if names_ii.size > 0
      names_ii.each do |name_ii|
        names << "#{name_i} #{name_ii}"
        names << "#{name_i} Male #{name_ii}"
        names << "#{name_i} #{name_ii} ♂"
      end
    else
      names << "#{name_i}"
      names << "#{name_i} Male"
      names << "#{name_i} ♂"
    end
  elsif gender == 'f'
    if names_ii.size > 0
      names_ii.each do |name_ii|
        names << "#{name_i} Female #{name_ii}"
        names << "#{name_i} #{name_ii} ♀"
      end
    else
      names << "#{name_i} Female"
      names << "#{name_i} ♀"
    end
  else
    puts "!! ERROR - unknown gender #{gender}:"
    pp rec
    exit 1
  end

  names += more_names   ## add more_names if any
  names = names.map {|str| str.strip.gsub(/[ ]{2,}/, ' ' )}  ## normalize spaces in more names



  meta << [meta.size,
           names[0],
           gender,
           "Archetype - #{type}",
           names[1..-1].join( ' | '),
          ]
end


####
#  add attributes


attributes.each do |rec|
  path = rec['path']
  sheet << Image.read( "../../punks.blocks/#{path}" )

  meta << [meta.size,
            rec['name'],
            rec['gender'],
            "Attribute",     ## add type e.g. Hair, Hat, Glasses, etc later - why? why not?
            rec['more_names'],
          ]
end



sheet.save( "./tmp/spritesheet.png" )
sheet.zoom(4).save( "./tmp/spritesheet@4x.png" )


headers = ['id', 'name', 'gender', 'type', 'more_names']
File.open( "./tmp/spritesheet.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ', '))
   f.write( "\n")
   meta.each do |values|
     f.write( values.join( ', ' ))
     f.write( "\n" )
   end
end

puts "bye"