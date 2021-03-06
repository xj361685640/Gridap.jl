
struct MultiFieldCellField{R,S} <: CellField
  single_fields::Vector{<:CellField}
  cell_map::AbstractArray
  ref_trait::Val{R}
  cell_axes::AbstractArray
  metasize::Val{S}
  function MultiFieldCellField(single_fields::Vector{<:CellField})
    @assert length(single_fields) > 0
    f1 = first(single_fields)
    cell_map = get_cell_map(f1)
    ref_style = RefStyle(f1)
    cell_axes = get_cell_axes(f1)
    metasize = MetaSizeStyle(f1)
    R = get_val_parameter(ref_style)
    S = get_val_parameter(metasize)
    new{R,S}(single_fields,cell_map,ref_style,cell_axes,metasize)
  end
end

Arrays.get_array(a::MultiFieldCellField) = @notimplemented

CellData.get_memo(a::MultiFieldCellField) = @notimplemented

CellData.get_cell_map(a::MultiFieldCellField) = a.cell_map

CellData.get_cell_axes(a::MultiFieldCellField) = a.cell_axes

CellData.RefStyle(::Type{<:MultiFieldCellField{R}}) where R = Val(R)

CellData.MetaSizeStyle(::Type{<:MultiFieldCellField{R,S}}) where {R,S} = Val(S)

Base.length(f::MultiFieldCellField) = length(first(f.single_fields))

num_fields(a::MultiFieldCellField) = length(a.single_fields)

Base.getindex(a::MultiFieldCellField,i) = a.single_fields[i]

Base.iterate(a::MultiFieldCellField)  = iterate(a.single_fields)

Base.iterate(a::MultiFieldCellField,state)  = iterate(a.single_fields,state)

function Fields.evaluate(cf::MultiFieldCellField,x::AbstractArray)
  s = """
  Evaluation of MultiFieldCellField objects is not implemented at this moment.
  You need to extract the individual fields and then evaluate them separatelly.
  If ever implemented, evaluating a `MultiFieldCellField` directly would provide,
  at each evaluation point, a tuple with the value of the different fields.
  """
  @notimplemented s
end

function Geometry.restrict(a::MultiFieldCellField,trian::Triangulation)
  f = (ai) -> restrict(ai,trian)
  blocks = map(f,a.single_fields)
  blocks
end

