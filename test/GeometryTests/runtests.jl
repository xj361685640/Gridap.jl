module GeometryTests

using Test

@testset "GridTopologies" begin include("GridTopologiesTests.jl") end

@testset "UnstructuredGridTopologies" begin include("UnstructuredGridTopologiesTests.jl") end

@testset "CellFields" begin include("CellFieldsTests.jl") end

@testset "Triangulations" begin include("TriangulationsTests.jl") end

@testset "Grids" begin include("GridsTests.jl") end

@testset "TriangulationPortions" begin include("TriangulationPortionsTests.jl") end

@testset "GridPortions" begin include("GridPortionsTests.jl") end

@testset "DiscreteModels" begin include("DiscreteModelsTests.jl") end

@testset "FaceLabelings" begin include("FaceLabelingsTests.jl") end

@testset "UnstructuredGrids" begin include("UnstructuredGridsTests.jl") end

@testset "CartesianGrids" begin include("CartesianGridsTests.jl") end

@testset "UnstructuredDiscreteModels" begin include("UnstructuredDiscreteModelsTests.jl") end

@testset "CartesianDiscreteModels" begin include("CartesianDiscreteModelsTests.jl") end

@testset "BoundaryTriangulations" begin include("BoundaryTriangulationsTests.jl") end

@testset "GenericBoundaryTriangulations" begin include("GenericBoundaryTriangulationsTests.jl") end

@testset "SkeletonPairs" begin include("SkeletonPairsTests.jl") end

@testset "SkeletonTriangulations" begin include("SkeletonTriangulationsTests.jl") end

end # module