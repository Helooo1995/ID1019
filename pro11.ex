defmodule Test do

def trans(_,_,[]) do [] end
def trans(a,b,[head|tail]) do
  if a == head do trans(a,b,tail)
  else [b * head|trans(a,b,tail)] end end

def sumt(l) do sumt(l,0) end
def sumt([],rev) do rev end
def sumt([head|tail],rev) do sumt(tail,rev+head) end

def eval({:const,n}) do n end
def eval({:add,a,b}) do eval(a) + eval(b) end
def eval({:mul,a,b}) do eval(a) * eval(b) end

def lookupp(var,[{var,n}|_]) do n end
def lookupp(var,[_|tail]) do lookupp(var,tail) end

def evall({:const,n},_) do n end
def evall({:var,v},utry) do lookupp(v,utry) end
def evall({:add,a,b},utry) do evall(a,utry) + evall(b,utry) end
def evall({:mul,a,b},utry) do evall(a,utry) * evall(b,utry) end

def driv({:const,n},_) do 0 end
def driv({var,x},x) do 1 end
def driv({var,_},_) do 0 end
def driv({:add,a,b},x) do {:add,driv(a,x),driv(b,x)} end
def driv({:mul,a,b},x) do {:add,{:mul,driv(a,x),b},{:mul,a,driv(b,x)}} end

def freq(x,[]) do [{x,1}] end
def freq(x,[{x,n}|tail]) do [{x,n+1}|freq(x,tail)] end
def freq(x,[{y,n}|tail]) do [{y,n}|freq(x,tail)] end

def frac([]) do [] end
def frac([head|tail]) do freq(head,frac(tail)) end

def flatten([]) do [] end
def flatten([head|tail]) do flatten(head) ++ flateen(tail) end
def flatten(a) do [a] end

def once(list) do once(list,0,0) end
def once([],l,s) do {s,l} end
def once([head|tail],l,s) do once(tail,l+1,head+s) end




end
