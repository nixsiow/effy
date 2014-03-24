User.destroy_all
Task.destroy_all

u1 = User.create(:name => 'nix', :about => 'good guy', :image => 'http://goo.gl/GpMj8b')
u2 = User.create(:name => 'fred', :about => 'playboy', :image => 'http://goo.gl/cbfgc8')
u3 = User.create(:name => 'pretty', :about => 'looking for love', :image => 'http://goo.gl/C6SNAS')

t1 = Task.create(:description => 'grocery shopping', :completed => false, :category => "UI")
t2 = Task.create(:description => 'buy egg', :completed => false, :category => "NUI")
t3 = Task.create(:description => 'buy apple', :completed => false, :category => "NUI")
t4 = Task.create(:description => 'buy jam', :completed => false, :category => "NUNI")
t5 = Task.create(:description => 'cellphone repairing', :completed => false, :category => "UI")

u1.tasks = [t1, t2]
u1.tasks << t3

u2.tasks = [t4, t5]
