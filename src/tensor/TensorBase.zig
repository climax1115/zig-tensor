const adapter_base = @import("TensorAdapterBase.zig");

const TensorAdapterBase = adapter_base.TensorAdapterBase;

/// Enum for various tensor backends.
pub const TensorBackendType = enum { ArrayFire };

/// Location of memory or tensors.
pub const Location = enum { Host, Device };

/// Alias to make it semantically clearer when referring to buffer location
const MemoryLocation = Location;

/// Tensor storage types.
pub const StorageType = enum(u8) { Dense = 0, CSR = 1, CSC = 2, COO = 3 };

/// Transformations to apply to Tensors (i.e. matrices) before applying certain
/// operations (i.e. matmul).
pub const MatrixProperty = enum(u8) { None = 0, Transpose = 1 };

/// Sorting mode for sorting-related functions.
pub const SortMode = enum(u8) { Descending = 0, Ascending = 1 };

pub const Tensor = struct {
    impl_: *TensorAdapterBase,
};
