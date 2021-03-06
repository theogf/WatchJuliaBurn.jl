# plain try throws
@test_throws LoadError macroexpand(@__MODULE__, :(@š begin
š
    println("Should not have come this far.")
    42
end))
# try...catch
@test 42 == @š begin
š
    2 + 40
š(e)
    rethrow()
end

@test 12 == @š begin
š
    2 + "40"
    error("This was not supposed to happen.")
š(e)
    e isa MethodError || rethrow()
    12
end

@test_throws DomainError @š begin
š
    cāÆĀ°ā”Ā°āāÆ(DomainError("On purpose!"))
š(e)
    rethrow()
end
# try...finally
@test @test_logs (:warn, "This worked!") @š(begin
š
    3*3
š
    @warn "This worked!"
end) == 9 # note that the parenthesis around (begin...end) are necessary here because == is infix

@test_logs (:info, "I ran!") @test_throws ErrorException @š begin
š
    error("On purpose!")
š
    @info "I ran!"
end
# try...catch...finally
@test_logs (:info, "I'm surprised that this works!") @test_throws ArgumentError @š begin
š
    cāÆĀ°ā”Ā°āāÆ(ArgumentError("Skyrim belongs to the Nords!"))
š(e)
    rethrow()
š
    @info "I'm surprised that this works!"
end

@test_logs (:warn, "Finally!") @test "Done" == @š begin
š
    "D"*"o"*"n"*"e"
š(e)
    rethrow()
š
    @warn "Finally!"
end
# nested monkeys
@test_logs (:info, "Try Finally") (:warn, "Catch Finally") @test_throws ErrorException @š begin
š
    @š begin
    š
        throw(ArgumentError("Inner throw"))
    š(e)
        e isa ArgumentError && throw(DomainError("Got caught once."))
    š
        @info "Try Finally"
    end
š(e)
    @š begin
    š
        e isa DomainError && throw(InitError(:here, e))
    š(e)
        e isa InitError && error("I'm still alive")
    š
        @warn "Catch Finally"
    end
end
# I'm too lazy to test all the other combinations

# leaving out the š throws
@test_throws LoadError macroexpand(@__MODULE__, :(@š begin
š(e)
    "Lol."
š
    "No!"
end))
