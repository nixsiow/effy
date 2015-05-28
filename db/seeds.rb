User.destroy_all
Task.destroy_all

u1 = User.create(:name => 'tester001', :password => 'abcd1234', :password_confirmation => 'abcd1234', :image => 'http://goo.gl/GpMj8b', :about => 'Playboy')
u2 = User.create(:name => 'tester002', :password => 'abcd1234', :password_confirmation => 'abcd1234', :image => 'http://goo.gl/GpMj8b', :about => 'Playboy')
u3 = User.create(:name => 'tester003', :password => 'abcd1234', :password_confirmation => 'abcd1234', :image => 'http://goo.gl/GpMj8b', :about => 'Playboy')
admin = User.create(:name => 'admin', :password => 'abcd1234', :password_confirmation => 'abcd1234', :image => 'http://goo.gl/GpMj8b', :about => 'I am admin.', :admin => true)

t1 = Task.create(:description => 'grocery shopping', :completed => false, :category => "UI")
t2 = Task.create(:description => 'buy egg', :completed => false, :category => "NUI")
t3 = Task.create(:description => 'buy apple', :completed => false, :category => "NUI")
t4 = Task.create(:description => 'buy jam', :completed => false, :category => "NUNI")
t5 = Task.create(:description => 'cellphone repairing', :completed => false, :category => "UI")

u1.tasks = [t1, t2]
u1.tasks << t3

u2.tasks = [t4, t5]
