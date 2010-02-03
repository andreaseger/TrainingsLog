# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)


#Group.create!(:name => 'Admin')
#Group.create!(:name => 'RegisteredUser')
#Group.create!(:name => 'Moderator')
#Group.create!(:name => 'Author')


User.create!(:username=>'sch1zo',:email=>'sch1zo@online.de',:password=>'secret',:password_confirmation => 'secret',:roles=>['admin'])
User.create!(:username=>'foobar',:email=>'foobar@online.de',:password=>'haus',:password_confirmation => 'haus',:roles=>['registered_user'])
User.create!(:username=>'baz',:email=>'baz@online.de',:password=>'haus',:password_confirmation => 'haus',:roles=>['author'])

Static.create!(:title => 'About', :permalink =>'about', :content => '\"Impressum\":impressum\r\n\r\n Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
Static.create!(:title => 'Impressum', :permalink =>'impressum', :content => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')

Stroke.create!(:name =>'Freestyle');
Stroke.create!(:name =>'Butterfly');
Stroke.create!(:name =>'Breaststroke');
Stroke.create!(:name =>'Backstroke');
Stroke.create!(:name =>'Individual medley');
Stroke.create!(:name =>'Warm up');
Stroke.create!(:name =>'Cool down');
Stroke.create!(:name =>'Catch up');
Stroke.create!(:name =>'Butterfly Catch Up');
Stroke.create!(:name =>'Kicking');
Stroke.create!(:name =>'Kicking Freestyle');
Stroke.create!(:name =>'Kicking Butterfly');


Tool.create!(:name => 'Poolboey')
Tool.create!(:name => 'Paddels')
Tool.create!(:name => 'Fins')
Tool.create!(:name => 'Paddels & Poolboey')
Tool.create!(:name => 'Paddels & Fins')



dist = [25,50,75,100,150,200,300,400,500]
0.upto(5){ |t|
  1.upto(4){ |s|
    dist.each{ |d|
      if t == 0 then
        @item = Item.new(:stroke_id => s, :tool_id => nil, :distance => d)
        @stroke = Stroke.find(s)
        @item.description = @item.distance.to_s + 'm ' + @stroke.name
        @item.save
      else
        @item = Item.new(:stroke_id => s, :tool_id => t, :distance => d)
        @stroke = Stroke.find(s)
        @tool = Tool.find(t)
        @item.description = @item.distance.to_s + 'm ' + @stroke.name + ', ' + @tool.name
        @item.save
      end
    }
  }
}
[100,200,400].each{ |d|
  @item = Item.new(:stroke_id => 5, :tool_id => nil, :distance => d)
  @stroke = Stroke.find(@item.stroke_id)
  @item.description = @item.distance.to_s + 'm ' + @stroke.name
  @item.save
}

@item = Item.new(:stroke_id => 6, :tool_id => nil, :distance => 400)
@stroke = Stroke.find(@item.stroke_id)
@item.description = @item.distance.to_s + 'm ' + @stroke.name
@item.save
@item = Item.new(:stroke_id => 7, :tool_id => nil, :distance => 300)
@stroke = Stroke.find(@item.stroke_id)
@item.description = @item.distance.to_s + 'm ' + @stroke.name
@item.save

#3.times do (
#Schedule.create!(:title =>'Nullam leo sapien', :body => 'Pellentesque quis lorem libero, sit amet tincidunt lacus. Nunc justo eros, dignissim et pretium ac, faucibus ut ligula. Nam sed nunc felis, in fringilla dolor. Nam eget diam placerat velit hendrerit venenatis. Ut id nisi mauris. Maecenas posuere imperdiet nisi sed tincidunt. Integer ultrices tortor vel tellus gravida interdum sed nec lorem. Duis at accumsan orci. Quisque auctor elit ut tortor faucibus consequat. Morbi ut lectus nulla, quis dapibus justo. Nunc arcu nulla, faucibus nec auctor eu, gravida ac risus. Proin nec lorem augue, eget congue ligula. Quisque vitae neque velit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis eleifend congue metus, blandit lobortis dolor feugiat in. Mauris dictum, urna ut adipiscing euismod, mauris quam facilisis purus, quis rhoncus ante orci ac magna. Sed dictum placerat orci eu blandit. Morbi aliquet nisi eu orci convallis pretium. Aliquam erat volutpat.', :tag_list => 'hase, bär, hund, pferd', :user_id => '1' )

#Schedule.create!(:title =>'Suscipit in ipsum', :body => 'In hac habitasse platea dictumst. Nullam porttitor, massa euismod egestas posuere, libero augue venenatis lorem, vel consequat risus nibh tincidunt nulla. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec libero libero, laoreet a feugiat sed, rhoncus sit amet arcu. Nam a enim arcu, sodales vestibulum nulla. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam imperdiet molestie ligula, sit amet auctor leo elementum ut. Vestibulum porttitor magna sed urna tempus ac vulputate libero semper. Suspendisse ante diam, vulputate vel dapibus vitae, porta vel erat. Pellentesque ultricies eleifend libero, in mollis enim consequat pulvinar. Fusce viverra leo nec augue vehicula dictum. Sed pellentesque ante id sapien molestie nec eleifend justo sagittis. Cras vel leo orci, tincidunt posuere ligula. Etiam pharetra enim non mi tempor in posuere augue feugiat.', :tag_list => 'bär, pferd, bar, fuss', :user_id => '3' )

#Schedule.create!(:title =>'Nullam porttitor', :body => 'Vivamus et est sapien. Donec ac velit velit. Sed adipiscing, augue vel tempus vestibulum, orci diam semper ante, egestas interdum dolor tortor at eros. Donec lacinia condimentum velit eget dictum. Quisque non justo non nulla viverra sagittis. Mauris sagittis cursus gravida. Aenean vitae eros in velit convallis elementum. Nulla facilisi. Maecenas imperdiet, lectus a tincidunt accumsan, lorem lectus rutrum enim, eu ultrices dolor nisl id arcu. Duis sagittis suscipit est nec varius. Phasellus ante diam, luctus nec sagittis vitae, suscipit in ipsum.', :tag_list => 'fuss, hund, bär, hase', :user_id => '1' )
#)

