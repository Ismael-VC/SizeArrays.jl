module SizeArrays

    import Base: *, A_mul_B!, convert, getindex, setindex!, similar, size, zero
    export SizeVector, SizeMatrix
    
    immutable SizeVector{T,S} <: DenseArray{T,1}
        data::Array{T,1}
    end
    SizeVector{T}(x::Array{T,1}) = SizeVector{T,length(x)}(x)
    immutable SizeMatrix{T,Sm,Sn} <: DenseArray{T,2}
        data::Array{T,2}
    end
    SizeMatrix{T}(A::Array{T,2}) = SizeMatrix{T,size(A,1),size(A,2)}(A)

    convert{T,S}(::Type{SizeVector{T,S}}, x::Array{T,1}) = SizeVector(x)
    convert{T,Sm,Sn}(::Type{SizeMatrix{T,Sm,Sn}}, A::Array{T,2}) = SizeMatrix(A)
    convert{T,S}(::Type{AbstractVector{T}}, A::SizeVector{T,S}) = A
    convert{T}(::Type{AbstractArray{T}}, A::SizeVector) = convert(AbstractVector{T}, A)
    convert{T,Sm,Sn}(::Type{AbstractMatrix{T}}, A::SizeMatrix{T,Sm,Sn}) = A
    convert{T}(::Type{AbstractArray{T}}, A::SizeMatrix) = convert(AbstractMatrix{T}, A)
    convert{T,S}(::Type{Ptr{T}}, A::SizeVector{T,S}) = convert(Ptr{T}, A.data)
    convert{T,Sm,Sn}(::Type{Ptr{T}}, A::SizeMatrix{T,Sm,Sn}) = convert(Ptr{T}, A.data)

    similar(x::SizeVector) = SizeVector(similar(x.data))
    similar(A::SizeMatrix) = SizeMatrix(similar(A.data))
    similar{T}(x::SizeVector, ::Type{T}, n::(Int,)) = SizeVector(similar(x.data, T, n))
    similar{T}(A::SizeMatrix, ::Type{T}, n::(Int,Int)) = SizeMatrix(similar(A.data, T, n))

    getindex(A::SizeVector,i::Integer) = getindex(A.data, i)
    getindex(A::SizeMatrix,i::Integer) = getindex(A.data, i)
    getindex(A::SizeVector,i::Range1{Int}) = getindex(A.data, i)
    getindex(A::SizeMatrix,i::Range1{Int}) = getindex(A.data, i)
    getindex(A::SizeVector,i::Integer,j::Integer) = getindex(A.data,i,j)
    getindex(A::SizeMatrix,i::Integer,j::Integer) = getindex(A.data,i,j)
    
    setindex!(A::SizeVector, x, i::Integer) = setindex!(A.data, x, i)
    setindex!(A::SizeMatrix, x, i::Integer) = setindex!(A.data, x, i)
    setindex!(A::SizeVector, x, i::Integer, j::Integer) = setindex!(A.data, x, i, j)
    setindex!(A::SizeMatrix, x, i::Integer, j::Integer) = setindex!(A.data, x, i, j)

    size{T,S}(A::SizeVector{T,S}) = (S,)
    size{T,Sm,Sn}(A::SizeMatrix{T,Sm,Sn}) = (Sm,Sn)

    zero{T,S}(::Type{SizeVector{T,S}}) = SizeVector(zeros(T,S))
    zero{T,Sm,Sn}(::Type{SizeMatrix{T,Sm,Sn}}) = SizeVector(zeros(T,Sm,Sn))

end # module
