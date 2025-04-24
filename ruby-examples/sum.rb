def sumdigits(digit1, digit2)
    @sum = digit1
    @next = digit1+1
    while @next <= digit2
      puts "sum = #{@sum}"
      @sum+=@next
      @next+=1
    end
    puts "sum = #{@sum}"
  end
  
  sumdigits(1, 100)