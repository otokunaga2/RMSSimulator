#mexico 
object={:CHINA => 0.8382352941,:RUSSIA => 0.6911764706,
        :AFRICA => 0.7720588235,:MEXICO => 0.8073529412,:GHANA => 0.7338235294,:INDIA => 0.6602941176}

gradient_number={:CHINA => 1.102941176,:RUSSIA =>0.9852941176,
       :AFRICA =>1.029411765,:MEXICO => 1 ,:GHANA =>0.9558823529,:INDIA =>0.8970588235}
@alpha = 0.3
step_slide = 0.00001
@max_simulation_steps = 10950
#init number


restored_map = {}
object.map{|key,value|
  restored_map[key] = value*0.5
}
p restored_map


@approximate_value
def calc_gradient(step_slide: 0.00001,object_goal: nil, alpha: nil)
  diff = 100
  @r = 0
  for i in 0..10000
    @r = step_slide.to_f + @r.to_f
    tmp_diff = (object_goal - @alpha*(1+@r)**@max_simulation_steps).abs
    if diff.to_f > tmp_diff.to_f
      diff = tmp_diff
      @approximate_value=@r
    end
  end
  @approximate_value
end
@result_map = {}
restored_map.map{|key,value|
  @result_map[key] = calc_gradient(step_slide: step_slide,object_goal: object[key],alpha: gradient_number[key])
}

p @result_map
