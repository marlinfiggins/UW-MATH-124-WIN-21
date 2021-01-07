### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 9c0abdb4-4703-11eb-2bcf-6387d2445b8a
using Plots

# ╔═╡ 22dc1d68-4709-11eb-1112-f31e0854356f
using PlutoUI, LaTeXStrings

# ╔═╡ ae386df6-4703-11eb-200c-e9d7e818f15e
md"""
## Week 1: Circles and Lines

**Author:** Marlin Figgins.
**Date:** Jan 5, 2021.

The goal of this notebook is to review the tools needed to be able to complete worksheet 1. We'll begin with some review of lines, slopes, and circles. Then we'll use a bit of geometry to show how to find the tangent line to a circle.
"""

# ╔═╡ becfe73e-4703-11eb-1def-a357f306b5ff
md"""
## Review: Lines 

Lines (and linear functions) are a building block in most areas of mathematics and its applications. They are essentially one of the simplest geometric objects and form the basis for the techniques we use when analyzing more complicated shapes.
"""

# ╔═╡ f5d9047a-4af2-11eb-2339-2b7b83990bbe
begin
	n_lines = 3
	random_m = 2 .* rand(n_lines) .- 1
	random_b = 2 .* rand(n_lines) .- 1
	x_coord = -1:1
	
	fig1 = plot(x_coord,  random_m[1] .* x_coord .+ random_b[1],
		legend = false,
		xticks = false,
		yticks = false)
	for i in 2:n_lines
		fig1 = plot!(x_coord,  random_m[i] .* x_coord .+ random_b[i])
	end
	
	fig1
end

# ╔═╡ 94fd0c3e-4af5-11eb-3968-1316069a9e8d
md"""
In earlier mathematics classes, you've likely learned how to find lines using several different but equivalent representations. We'll review how to solve for a line with these different representations.

First, we'll use the two-points representation. This is probably the one all of us are most familar with on a intuitive level! This is just the statement that any two points has a unique straight line between them. In mathematical language, we say that if we have two points $(x_{0}, y_{0})$ and $(x_{1}, y_{1})$, then the line has formula

```math
y - y_{0} = \frac{y_1 - y_0}{x_1 - x_0}  (x - x_0)
```
"""

# ╔═╡ 5533ef12-4af7-11eb-110e-23ea2ff268fb
begin 
	fig2 = deepcopy(fig1)
	
	rx_points =  2 .* rand(2) .- 1
	fig2 = scatter!(rx_points,  random_m[1] .* rx_points .+ random_b[1],
		color = "white",
		legend = false,
		xticks = false,
		yticks = false)
	
	for i in 2:n_lines
		rx_points =  2 .* rand(2) .- 1
		fig2 = scatter!(rx_points,  random_m[i] .* rx_points .+ random_b[i],
				color = "white")
	end
	
	fig2
end

# ╔═╡ 4fdb0a00-4af7-11eb-3fa2-bb120202054d
md"""
Next up, is the point-slope representation. That is, we can uniquely define any of the lines above by specifying a single point $(x_{0}, y_{0})$ on the line and its slope $m$:

```math
y - y_{0} = m (x - x_{0}).
```

Notice, that this is the same as the two point representation except we use $m$ to signify the slope of the line which can be computed using any two points as

```math
m = \frac{y_{1} - y_{0}}{x_{1} - x_{0}}.
```
"""

# ╔═╡ e6c5c248-4af9-11eb-1e09-455232f6e2ce
begin 
	fig3 = plot(x_coord,  random_m[1] .* x_coord .+ random_b[1],
		legend = false,
		xticks = false,
		yticks = false)
	for i in 2:n_lines
		fig3 = plot!(x_coord,  random_m[i] .* x_coord .+ random_b[i])
	end
	
	fig3 = scatter!([rx_points[1]],  [random_m[1] * rx_points[1] + random_b[1]],
		color = "white",
		legend = false,
		xticks = false,
		yticks = false)
	
	for i in 2:n_lines
		rx_points =  2 .* rand(1) .- 1
		fig3 = scatter!([rx_points[1]],  [random_m[i] * rx_points[1] + random_b[i]],
				color = "white")
	end
	
	fig3
end

# ╔═╡ 7ed2de82-4af7-11eb-1439-8d3b5cee0ae0
md"""
Lastly, we have slope-intercept form. This is when we write the line in the form

\begin{equation}
y = m x + b.
\end{equation}

Here, $m$ is the slope as before and $b$ is the $y$-intercept. The $y$-intercept $b$ is just the value of the line when $x = 0$. You can see this since

\begin{equation}
y = m \cdot 0 + b = b.
\end{equation}

This allows us to uniquely define a line by its value at $x = 0$ and the slope of the line itself.
"""

# ╔═╡ d40d36f6-4afa-11eb-003b-a7e088f40e15
begin 
	fig4 = plot(x_coord,  random_m[1] .* x_coord .+ random_b[1],
		legend = false,
		xticks = false,
		yticks = false)
	for i in 2:n_lines
		fig4 = plot!(x_coord,  random_m[i] .* x_coord .+ random_b[i])
	end
	
	fig4 = scatter!([rx_points[1]],  [random_m[1] * rx_points[1] + random_b[1]],
		color = "white",
		legend = false,
		xticks = false,
		yticks = false)
	
	for i in 2:n_lines
		fig4 = scatter!([rx_points[1]],  [random_m[i] * rx_points[1] + random_b[i]],
				color = "white")
	end
	
	fig4
end

# ╔═╡ e0abe984-4703-11eb-1d47-a945691991cb
md"""
## Tangent Lines

In calculus, we're often interested in finding the tangent line to shapes of interest. For our purposes, this is the same as finding the point which touches a curve at one point and has the same direction of the curve at the point of contact. This point of contact is called the *point of tangency*.
"""

# ╔═╡ 814a9bb0-4afb-11eb-287d-8537b497853d
begin 
	a = -0.1
	example_func(x) = x^3 - x^2 - x - 1
	example_deriv(x) = 3*x^2 - 2*x - 1
	example_tangent(x) = example_deriv(a) * (x - a) + example_func(a) 
	
	plot(example_func, -1, 1,
		linewidth = 1.5,
		label = "Original Function",
		xticks = false,
		yticks = false)
	
	plot!(example_tangent, -1, 1,
		linewidth = 1.5,
		label = "Tangent line")
	
	scatter!([a], [example_func(a)],
			label = "Point of tangency",
			color = "white")
end

# ╔═╡ ec0bd9e4-4703-11eb-26e3-834539a39d83
md"""
### Circles
A circle has the following equation

```math
(x - h)^2 + (y - k)^2 = r^2,
```
where $(h,k)$ is the center of the circle and $r$ is its radius. In what follows, we'll use the shorthand $P = (h,k)$ for the center of the circle. You might also write the circle as a parametric equation with $x$ and $y$ functions

```math
x(t) = r \cos(t) + h
```
```math
y(t) = r \sin(t) + k,
```
but we'll primarily work with the first characterization in what follows.
"""

# ╔═╡ 12af1234-4705-11eb-06f5-970c779f5b1a
begin
	function circle(h, k, r)
		t = 0:0.01:2π
		return h .+ r .* cos.(t), k .+ r .* sin.(t);
	end	
end

# ╔═╡ 65b256c2-4704-11eb-06a9-ffdcd2545045
md"""
### Tangent line of a circle

In the case of the circle, we don't actually need any tools of calculus to solve for the tangent line if we've given the point of tangency. We'll rely on some fun facts of geometry. In the case of circles, we know that the tangent line intersects the circle at exactly one place.
"""

# ╔═╡ 42233d1e-4afd-11eb-3af1-71cc1b4e9829
md"""
We can solve for the tangent line using the fact that the tangent line at a point $Q$ is going to be perpendicular to the line connecting the center of the circle $P$ to the point $Q$. We'll begin by just graphing the points $P$ and $Q$ and the line connecting them on the circle.
"""

# ╔═╡ 7aa4a83c-4709-11eb-3ec5-8784f5748b62
begin 
	h = 0;
	k = 0;
	t = 51;
	
	#(0:0.01:2π)[t]
	#@bind t Slider(1:10:length(0:0.01:2π))

	println("Empty Line")
end

# ╔═╡ 736a0656-4705-11eb-229a-6b60032aa346
begin
	circle_xs, circle_ys = circle(h,k,1)
	plot(circle_xs, circle_ys,
		size = (500,500),
		linewidth = 2,
		color = "black",
		label = false,
		xlim = (-1.1, 1.1),
		ylim = (-1.1,1.1),
		xticks = false,
		yticks = false)
	
	plot!([h, circle_xs[t]], [k, circle_ys[t]], 
		  label = false,
		  linewidth = 1.5,
		  linestyle = :dash,
		  color = "black")
	
	scatter!([h], [k], markersize = 5, label = "P")
	scatter!([circle_xs[t]], [circle_ys[t]], markersize = 5, label = "Q")
end

# ╔═╡ ff1f5862-4afd-11eb-1aa1-61f93e244a87
md"""
As you can see below, the tangent line that touches the circle at point $Q$ forms a right angle with the radial line we graphed in the last plot. In short, the two lines are perpendicular.
"""

# ╔═╡ f617bf5c-4706-11eb-00d0-35f62229ff28
begin
	m = (circle_ys[t] - k) / (circle_xs[t] - h)
	tangent_circle(x) = (-1/m)*(x-circle_xs[t]) + circle_ys[t]
	
	plot!(tangent_circle, -1, 1,
		label = false,
		linewidth = 1.5,
		color = "black")
end

# ╔═╡ c1a9822c-4afe-11eb-35ee-4d9b576c273d
md"""
One fact of geometry is that lines which are perpendicular have slopes which are negative reciprocals of one another. That is, if the line connecting $P$ and $Q$ has slope $m_{PQ}$, then the tangent line has slope

```math
m_{\tan Q} = - \frac{1}{m_{PQ}}.
```
"""

# ╔═╡ 88c3e17c-4aff-11eb-2611-b5549aaeaa54
md"""
This allows us to solve for the tangent line to the circle at point $Q$ with just a bit of algebra since we have the slope of the tangent line and the point of tangency $Q$. We can write these steps clearly as:

**Finding the tangent line to a circle at a point $Q$**

1. Compute the slope $m_{PQ}$ of the radial line connecting the center $P$ and $Q$.
2. Compute the slope of the tangent line at point $Q$ using $m_{\tan Q} = - \frac{1}{m_{PQ}}$.
3. Solve for the tangent line using the point $Q$ and the slope $m_{\tan Q}$.
"""

# ╔═╡ 7ad2d2ce-4fbb-11eb-2566-0d1ecf72b897
md""" ## Application: Intersection of tangent lines. 

Consider the circle with radius 2 centered at $C = (0, 0)$. For the following sets of points $P$ and $Q$, find the point(s) where the lines tangent to the circle at $P$ and $Q$ intersect if they exist.

(a) $P = (-\sqrt{2}, \sqrt{2})$, $Q = (\sqrt{2}, \sqrt{2})$

(b) $P = (-1, \sqrt{3})$, $Q = (1, -\sqrt{3})$

(c) $P = (\sqrt{2}, \sqrt{2})$, $Q = (1, \sqrt{3})$

"""

# ╔═╡ eab8e50e-4fc2-11eb-25d0-05d133782270
md""" #### Part (a)

We'll begin by graphing the the points and the two lines. 
"""

# ╔═╡ c6661a46-4fc9-11eb-0d58-4d38df0118ee
md""" 
From the plot above, we can see that there is a clear point of intersection, but how do we solve for it? 

##### Finding the tangent line to the circle at $P$

Our first step is to find the equation for the two tangent lines of interest with the theory we developed earlier. First, let's find the equation of the tangent line at point $P$. This means finding the slope of the radial line connecting the center of the circle $C = (0,0)$ to the point $P = (-\sqrt{2}, \sqrt{2})$. We can find this slope using the familiar rise-over-run formula:

```math
m_{CP} = \frac{\Delta y}{\Delta x} = \frac{\sqrt{2} - 0}{-\sqrt{2} - 0} = -1.
```

Since the radial line from $C$ to $P$ is perpendicular to the tangent line to the circle at point $P$, we have that the slope of the tangent line at $P$ is 

```math
m_{\tan P} = -\frac{1}{m_{CP}} = 1.
```

Additionally, we know that the tangent line at $P$ must pass through the point $P$, so we can write the equation of the tangent line using the point-slope formula as:

```math
y - \sqrt{2} = 1 (x - ( - \sqrt{2})) = x + \sqrt{2}
```

or alternatively after a bit of algebra
```math
y = x + 2\sqrt{2}.
```

##### Finding the tangent line to the circle at $Q$
We can repeat this same process but instead using the point $Q = (\sqrt{2}, \sqrt{2})$. Solving for the slope 

```math
m_{CQ} = \frac{\Delta y}{\Delta x} = \frac{\sqrt{2} - 0}{\sqrt{2} - 0} = 1.
```

Once again, since the radial line must be perpendicular to the tangent line, we have that

```math
m_{\tan Q} = -\frac{1}{m_{CQ}} = -1.
```

Using point-slope form, this is

```math
y - \sqrt{2} = -1 (x -  \sqrt{2})
```

or after some algebra

```math
y = -x + 2\sqrt{2}.
```

##### Finding the intersection of the tangent lines

Now that we have the equations of the two tangent lines, we can solve for their intersection as follows. We know that the point we're interested in solving for is $(x,y)$ which is on both of the tangent lines we solved for. Therefore, it is the solution to both of the equations we found simulataneously i.e.

```math
y = x + 2\sqrt{2} \text{ AND }
 y = -x + 2\sqrt{2}.
```
Setting the two equations equal to one another, we see that

```math
x + 2 \sqrt{2} = -x + 2\sqrt{2}
```
Substracting over the $2\sqrt{2}$, we see that $x = -x$, so our solution has $x = 0$. We solve for the corresponding $y$ using either equations which shows that $y = 2\sqrt{2}$. Therefore our final solution is $(0, 2\sqrt{2})$, which you can see plotted on the graph below.


**Exercise:** Based only on the equation of the tangent lines, what is the angle between the two tangent lines? 
"""

# ╔═╡ bae2a594-4fc5-11eb-0509-f920c67af600
md""" 
#### Part (b)

We can simply follow the approach of part (a) here. 


##### Finding the tangent line at point $P = (-1, \sqrt{3})$

Starting with the slope of the radial line, we compute

```math
m_{CP} = \frac{\sqrt{3} - 0}{ - 1 } = - \sqrt{3}
```
Therefore, the tangent line has slope

```math
m_{\tan P} = - 1 / m_{CP} = \frac{1}{\sqrt{3}},
```

which shows that our tangent line has equation

```math
y  - \sqrt{3} = \frac{1}{\sqrt{3}} (x + 1).
```

##### Finding the tangent line at point $Q = (1, -\sqrt{3})$

Repeating this process for point $Q$, we see

```math
m_{CQ} = \frac{-\sqrt{3} - 0}{1 - 0} = -\sqrt{3}.
```

Next, we find the slope of our tangent line

```math
m_{\tan Q} = - 1 / m_{CQ} = \frac{1}{\sqrt{3}}.
```

We can finish by using point-slope to find the equation of our tangent line.
```math
y + \sqrt{3} = \frac{1}{\sqrt{3}} ( x - 1).
```

##### Point of intersection?

As before we can try and solve for the point of intersection using the two equations by setting them equal to one another, but what we'll quickly notice is that there is no solution here. This is because the two tangent lines have equal slopes are parralel and by definition have no point of intersection. We can see this more clearly by graphing the circle below.
"""

# ╔═╡ 8be12e48-4fc8-11eb-27bc-6198c13f2c6e
md"""

### Part (c)

Try setting up and finishing part (c) on your own.

"""

# ╔═╡ 242d7740-4fc4-11eb-2db7-11cfca6413fe
begin
	## Helper Functions
	
		function add_points(P, name)
				scatter!([P[1]], [P[2]], 
				label = name)
		end
	
		function add_lines(P, m)
			plot!(x -> m*(x-P[1]) + P[2], -3, 3,
				label = false, 
				linewidth = 1.5,
				color = "grey")
		end
	
		function find_tangent_slope(P, C)
			m =  - (P[1] - C[1] ) / (P[2] - C[2])
		end
	println("Empty Line because Pluto is weird")
end

# ╔═╡ 7938440e-4fbf-11eb-30f5-cde38c57d1cc
begin
		Pa = (-sqrt(2), sqrt(2))
		Qa = (sqrt(2), sqrt(2))
	
		ex_xs, ex_ys = circle(0,0,2)
		Ex1 = plot(ex_xs, ex_ys,
			size = (500,500),
			xlim = (-3, 3),
			ylim = (-3, 3),
			linewidth = 2,
			color = "black",
			aspect_ratio = :equal,
			label = false)
		Ex1 = scatter!([0], [0], label = "C")
		
		Ex1 = add_points(Pa, "P")
		Ex1 = add_points(Qa, "Q")
	
		Ex1 = add_lines(Pa, 
				 find_tangent_slope(Pa, (0,0)))
		Ex1 = add_lines(Qa, 
				find_tangent_slope(Qa, (0,0)))	 
end

# ╔═╡ 7cc3dd0a-4fcd-11eb-3644-5308c93514c7
scatter!(Ex1, [0], [2*sqrt(2)], 
		label = L"(0, 2 \sqrt{2})",
		markersize = 6,
		color = "Yellow")

# ╔═╡ 8a7cba3c-4fc5-11eb-32af-f5fae59dba6e
begin
			Pb = (-1, sqrt(3))
			Qb = (1, -sqrt(3))
		
			plot(ex_xs, ex_ys,
				size = (500,500),
				linewidth = 2,
				color = "black",
				aspect_ratio = :equal,
				label = false)
			scatter!([0], [0], label = "C")
			
			add_points(Pb, "P")
			add_points(Qb, "Q")
		
			add_lines(Pb, 
					 find_tangent_slope(Pb, (0,0)))
			add_lines(Qb, 
					find_tangent_slope(Qb, (0,0)))	 
end

# ╔═╡ Cell order:
# ╟─ae386df6-4703-11eb-200c-e9d7e818f15e
# ╟─becfe73e-4703-11eb-1def-a357f306b5ff
# ╟─f5d9047a-4af2-11eb-2339-2b7b83990bbe
# ╟─94fd0c3e-4af5-11eb-3968-1316069a9e8d
# ╟─5533ef12-4af7-11eb-110e-23ea2ff268fb
# ╟─4fdb0a00-4af7-11eb-3fa2-bb120202054d
# ╟─e6c5c248-4af9-11eb-1e09-455232f6e2ce
# ╟─7ed2de82-4af7-11eb-1439-8d3b5cee0ae0
# ╟─d40d36f6-4afa-11eb-003b-a7e088f40e15
# ╟─e0abe984-4703-11eb-1d47-a945691991cb
# ╟─814a9bb0-4afb-11eb-287d-8537b497853d
# ╟─ec0bd9e4-4703-11eb-26e3-834539a39d83
# ╟─12af1234-4705-11eb-06f5-970c779f5b1a
# ╟─65b256c2-4704-11eb-06a9-ffdcd2545045
# ╟─42233d1e-4afd-11eb-3af1-71cc1b4e9829
# ╟─7aa4a83c-4709-11eb-3ec5-8784f5748b62
# ╟─736a0656-4705-11eb-229a-6b60032aa346
# ╟─ff1f5862-4afd-11eb-1aa1-61f93e244a87
# ╟─f617bf5c-4706-11eb-00d0-35f62229ff28
# ╟─c1a9822c-4afe-11eb-35ee-4d9b576c273d
# ╟─88c3e17c-4aff-11eb-2611-b5549aaeaa54
# ╟─9c0abdb4-4703-11eb-2bcf-6387d2445b8a
# ╟─7ad2d2ce-4fbb-11eb-2566-0d1ecf72b897
# ╟─eab8e50e-4fc2-11eb-25d0-05d133782270
# ╟─7938440e-4fbf-11eb-30f5-cde38c57d1cc
# ╟─c6661a46-4fc9-11eb-0d58-4d38df0118ee
# ╟─7cc3dd0a-4fcd-11eb-3644-5308c93514c7
# ╟─bae2a594-4fc5-11eb-0509-f920c67af600
# ╟─8a7cba3c-4fc5-11eb-32af-f5fae59dba6e
# ╟─8be12e48-4fc8-11eb-27bc-6198c13f2c6e
# ╟─242d7740-4fc4-11eb-2db7-11cfca6413fe
# ╟─22dc1d68-4709-11eb-1112-f31e0854356f
