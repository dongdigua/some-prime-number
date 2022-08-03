c = Channel{Int}(32)
n = 500
acc = []

@time function worker6(n, add_num)
    Threads.@threads for i in 1:n
        a = 6i + add_num
        if is_prime(a)
            put!(c, a)
        end
    end
    # you can't close(c) here,
    # you should wait until the two task stop
end

function is_prime(n)
    prime = true
    for i in 3:sqrt(n)
        if i % 2 == 0
            continue
        elseif n % i == 0
            prime = false
            break
        end
    end
    prime
end

t1 = @task worker6(n, 1)
t2 = @task worker6(n, 5)
schedule(t1)
schedule(t2)

@async for i in c
    push!(acc, i)
end

wait(t1)
wait(t2)
close(c)

print(sort(acc))
