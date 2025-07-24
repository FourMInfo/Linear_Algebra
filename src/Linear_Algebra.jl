module Linear_Algebra
using Reexport
@reexport using  GeometryBasics, Plots, LinearAlgebra, RationalRoots, Symbolics

# Configure plotting for both interactive and headless environments
if haskey(ENV, "CI") || get(ENV, "GKSwstype", "") == "100"
    # CI or headless environment - use headless mode
    ENV["GKSwstype"] = "100"
    gr(show=false)
else
    # Interactive environment - normal plotting
    gr()
end

# Exports...
# Pure computational functions (no plotting dependencies)
export calculate_param_line
# Integrated plotting functions (computation + visualization)
export distance_2_points, center_of_gravity, barycentric_coord, plot_param_line
export vector_angle_cos, is_orthogonal, polar_unit, orthproj, reflection, rotation
export point_in_implicit_line, parametric_to_implicit_line, implicit_to_parametric_line, explicit_line
export distance_to_implicit_line, implicit_line_point_normal_form, distance_to_pnf_implicit_line
export distance_to_parametric_line, foot_of_line, intersection_2_parametric_lines, intersection_2_implicit_lines
export rationalize
export projection_matrix_symbolic, projection_matrix_symbolic_polar, projection_matrix, projection_matrix_polar
export projection_matrix_transpose, rotation_matrix_symbolic, rotation_matrix, rotation_matrix_ns
export stretch_matrix_symbolic, stretch_matrix
export reflection_matrix_symbolic, reflection_matrix, reflection_matrix_rational

# Re-export the @variables macro
eval(:(export @variables))

include("linear_algebra_basic.jl")
include("linear_algebra_transform.jl")

end # module