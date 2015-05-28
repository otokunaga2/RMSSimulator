
object_beta=0.8073529412 
alpha = 0.3
step_slide = 0.00001
r = 0
max_simulation_steps = 10950
#init number
diff = 100
for i in 0..10000
  r = step_slide.to_f + r.to_f
  tmp_diff = (object_beta - alpha*(1+r)**max_simulation_steps).abs
  if diff.to_f > tmp_diff.to_f
    diff = tmp_diff
  end
end
p "reslut #{diff}"
