### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 82deace6-507d-11eb-19f1-8711faa73635
using PlutoUI, Plots, LaTeXStrings

# ╔═╡ 9a10a468-507c-11eb-0fbb-0f453554e499
md"""
# Week 1: Secant and Tangent lines

**Author:** Marlin Figgins. **Date:** Jan 06, 2021.

The goal of this notebook is to elucidate the relationship between the secant and the tangent line to a curve. We'll also reframe this relationship in terms of average and instanteous rates of change.
"""

# ╔═╡ b0b6027a-507f-11eb-2e7a-27b3ca9569e5
md"""
## Secant Line

Simply put, a secant line is any straight line which joins two points on a curve.
"""

# ╔═╡ 1a0bb026-5080-11eb-25e4-57bac77b033d
begin
	f_1(x) = x^3 + x^2 - x - 1
	
	a1 = -1.5
	b1 = 2.25
	
	plot(f_1, 
		-3, 3,
		label = L"f(x)",
		linewidth = 1.5,
		color = "black",
		xticks = false,
		yticks = false)
	
	plot!( x -> (f_1(b1) - f_1(a1))/(b1 - a1) * (x - a1) + f_1(a1),
		-3, 3,
		color = "orange",
		label = "Secant line")
	
	scatter!( [a1], [f_1(a1)],
		color = "white",
		markersize = 6,
		label = false)
	
	scatter!([b1], [f_1(b1)],
		color = "white",
		markersize = 6,
		label = false)
end

# ╔═╡ 371ed380-5082-11eb-3081-3f922e11d1d0
md"""
Since we've primarily interested in the functional forms of such curves, we'll re-cast the definition of the secant curve in terms of a function $f$. Let's say that we want to find secant line between two points $a$ and $b$ on the function $f$. We can write the points on the function itself as $(a, f(a))$ and $(b, f(b))$ which we visualize below.
"""

# ╔═╡ 8aa2e226-5082-11eb-1863-ad4351d89db2
begin
	plot(f_1, 
		-3, 3,
		label = L"f(x)",
		linewidth = 1.5,
		color = "black",
		xticks = false,
		yticks = false)
	
	plot!( x -> (f_1(b1) - f_1(a1))/(b1 - a1) * (x - a1) + f_1(a1),
		-3, 3,
		color = "orange",
		label = "Secant line")
	
	scatter!( [a1], [f_1(a1)],
		color = "white",
		markersize = 6,
		label = false)
	
	annotate!( [a1], [f_1(a1) - 4.5], L"(a, f(a))", textsize = 5)
	
	scatter!([b1], [f_1(b1)],
		color = "white",
		markersize = 6,
		label = false)
	
	annotate!( [b1 + 0.3], [f_1(b1) - 4], L"(b, f(b))", textsize = 5)

end

# ╔═╡ 4c9acdfa-5083-11eb-3ef1-1d3bf8880bef
md"""
Since we know the position of two points on the secant line, we can write the slope of our secant line as

```math
m = \frac{\text{Rise}}{\text{Run}} = \frac{f(b) - f(a)}{b - a}
```

We can think of  this slope $m$ as describing the *average* change in the function $f$ between $a$ and $b$. Let's do a quick example to see what's going on here.
"""

# ╔═╡ b48e1642-5084-11eb-385e-8b50c677cb92
md"""

#### Example 1: Finding the secant line.

**Problem:** Compute the formula for the secant line between $a = 0$ and $b = 2$ for $f(x) = x^2$. In order to find the formula of the secant line, we need a slope and a point. We'll begin by finding the slope using the formula we derived above, so that

```math
m = \frac{f(2) - f(0)}{2 - 0} = \frac{2^2 - 0^2}{2 - 0} = 2.
```
Additionally, we know that the point $(a, f(a))$ lies on the curve of the function $f$, so we can solve for the equation of the tangent line as

```math
y - f(0) = m ( x - 0) \implies y = 2x.
```
"""

# ╔═╡ 9876359e-508f-11eb-20af-7be789d66b2c
begin
	f_2(x) = x^2
	a2 = 0
	b2 = 2
	
	plot(f_2, 
		-3, 3,
		label = L"x^2",
		linewidth = 1.5,
		color = "black")
	
	plot!( x -> (f_2(b2) - f_2(a2))/(b2 - a2) * (x - a2) + f_2(a2),
		-3, 3,
		color = "orange",
		label = L"y = 2x")
	
	scatter!( [a2], [f_2(a2)],
		color = "white",
		markersize = 6,
		label = false)
		
	scatter!([b2], [f_2(b2)],
		color = "white",
		markersize = 6,
		label = false)
	
end

# ╔═╡ ce774fac-5085-11eb-139c-878de40d2658
md"""
## Tangent lines

In previous sections, we've shown how to find the tangent line to a circle using geometry and other properties of lines. We'll now expand this notion to more general curves. As opposed to the secant line, the tangent line is a line which touches a curve at a point and has the same direction of that curve at the point of contact. 
"""

# ╔═╡ 67d2ebc0-5086-11eb-24c6-99f48646bcaa
begin
	
	f_1_prime(x) = 3*x^2 + 2*x - 1

	plot(f_1, 
			-3, 3,
			label = L"f(x)",
			linewidth = 1.5,
			color = "black",
			xticks = false,
			yticks = false)
		
		plot!( x ->  f_1_prime(a1) * (x - a1) + f_1(a1),
			-3, 3,
			color = "green",
			label = "Tangent line")
		
		scatter!( [a1], [f_1(a1)],
			color = "white",
			markersize = 6,
			label = false)
end

# ╔═╡ b959d364-5086-11eb-0296-5d9363d44711
md"""
In many simple cases, we can find the tangent line by approximating it using secant lines. We'll use the above as an example. Suppose that we want to find the tangent line to $f$ at $x = a$. We can try and approximate this tangent line using the secant line between $a$ and $b$ for $b\approx a$. As $b$ gets closer to $a$, the slope of the secant line or the average rate of change of $f$ between $a$ and $b$ gets closer and closer to the slope of the tangent line or the *instanteous* rate of change of $f$ at $a$. We can see this process of convergence by picking $b$ sufficiently close to $a$, which we have done below.
"""

# ╔═╡ 27f6d934-5087-11eb-338a-dd3d28fe06c1
begin
	h1 = 0.05
	
		plot(f_1, 
			-3, 3,
			label = L"f(x)",
			linewidth = 1.5,
			color = "black",
			xticks = false,
			yticks = false)
		
		plot!( x ->  f_1_prime(a1) * (x - a1) + f_1(a1),
			-3, 3,
			color = "green",
			label = "Tangent line")
	
		plot!( x -> (f_1(a1 + h1) - f_1(a1))/(h1) * (x - a1) + f_1(a1),
		-3, 3,
		color = "orange",
		label = "Secant line")
		
		scatter!( [a1], [f_1(a1)],
			color = "white",
			markersize = 6,
			label = false)
	
		scatter!( [a1 + h1], [f_1(a1 + h1)],
			color = "white",
			markersize = 6,
			label = false)
end

# ╔═╡ 75a962a0-5087-11eb-2d7b-6d00fa8c005c
md"""
As you can see, these two lines are exceedingly close. For several key functions, we can actually directly solve for the slopes of their tangent lines using approximating secant lines.
"""

# ╔═╡ ca762d9a-5087-11eb-1d3d-85bf5ecfe5ef
md"""

#### Example 2: Estimating the slope of the tangent line. 
**Problem**: Estimate the slope of tangent line of $x^2$ at the point $x=0$.

We'll begin by finding the secant line between points $x=0$ and $x=a$. Following the equation derived above, we can compute the slope of this secant line as

```math
m = \frac{a^2 - 0^2}{a - 0} = \frac{a^2}{a}  = a.
```

Notice that this holds for any $a$, but since we're interested in values $a \approx 0$, we estimate that the slope of the tangent line is $m = 0$.
"""

# ╔═╡ 3d0c72fc-5091-11eb-3865-71342b0c55cc
begin
	plot(f_2, 
		-3, 3,
		label = L"x^2",
		linewidth = 1.5,
		color = "black")
	
	plot!( x -> 0,
		-3, 3,
		color = "green",
		label = L"y = 0")
	
	scatter!( [a2], [f_2(a2)],
		color = "white",
		markersize = 6,
		label = false)
end

# ╔═╡ Cell order:
# ╟─9a10a468-507c-11eb-0fbb-0f453554e499
# ╟─b0b6027a-507f-11eb-2e7a-27b3ca9569e5
# ╟─1a0bb026-5080-11eb-25e4-57bac77b033d
# ╟─371ed380-5082-11eb-3081-3f922e11d1d0
# ╟─8aa2e226-5082-11eb-1863-ad4351d89db2
# ╟─4c9acdfa-5083-11eb-3ef1-1d3bf8880bef
# ╟─b48e1642-5084-11eb-385e-8b50c677cb92
# ╟─9876359e-508f-11eb-20af-7be789d66b2c
# ╟─ce774fac-5085-11eb-139c-878de40d2658
# ╟─67d2ebc0-5086-11eb-24c6-99f48646bcaa
# ╟─b959d364-5086-11eb-0296-5d9363d44711
# ╟─27f6d934-5087-11eb-338a-dd3d28fe06c1
# ╟─75a962a0-5087-11eb-2d7b-6d00fa8c005c
# ╟─ca762d9a-5087-11eb-1d3d-85bf5ecfe5ef
# ╟─3d0c72fc-5091-11eb-3865-71342b0c55cc
# ╟─82deace6-507d-11eb-19f1-8711faa73635
