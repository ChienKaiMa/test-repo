# Exercise from
# https://juliateachingctu.github.io/Julia-for-Optimization-and-Learning/stable/lecture_03/exercises/

L = 1500
K = 1000
x = range(-1.5, 1.5; length = L)
y = range(-1.0, 1.0; length = K)
c = -0.4 + 0.61im
R = 2
N = 1000
A = zeros(K, L)

function juliaset(z, c, R, N)
	n = 0
	while n <= N && abs(z) <= R^2 - R
		z = z^2 + c
		n += 1
	end
	return n > N ? 0 : n / N
end

A = juliaset.(x' .+ y .* im, c, R, N)

# for k in 1:K, l in 1:L
# 	z = x[l] + y[k] * im
# 	A[k, l] = juliaset(z, c, R, N)
# end

# for k in 1:K, l in 1:L
# 	z = x[l] + y[k] * im
# 	for n in 0:N
# 		if abs(z) > R^2 - R
# 			A[k, l] = n / N
# 			break
# 		end
# 		z = z^2 + c
# 	end
# end

using Plots

heatmap(A;
	c = :viridis,
	clims = (0, 0.15),
	cbar = :none,
	axis = :none,
	ticks = :none,
	size = (800, 600),
)
