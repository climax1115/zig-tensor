//! The Memory Manager Device Interface.

/// An interface for using native device memory management and
/// JIT-related memory pressure functions. Provides support for
/// functions at the device and backend level, which automatically
/// delegate to the correct backend functions for native device
/// interoperability. The functions call directly into ArrayFire
/// functions.
///
/// Exposed as an external freestanding API in order to facilitate
/// sharing native device closures across different parts of a
/// memory manager implementation.
///
/// Functions are automatically set when a `MemoryManagerDeviceInterface`
/// that has been passed to a constructed `MemoryManagerAdapter` is
/// installed using `MemoryManagerInstaller`'s `setMemoryManager`
/// or `setMemoryManagerPinned` method. Until one of these has been
/// called, the functions therein remain unset.
///
/// For documentation of methods, refer to
/// [ArrayFire's memory header](https://git.io/Jv7do) for full specs.
pub const MemoryManagerDeviceInterface = struct {
    // native memory management functions
    getActiveDeviceId: *const fn () c_int,
    getMaxMemorySize: *const fn (device: c_int) usize,
    nativeAlloc: *const fn (len: usize) *anyopaque,
    nativeFree: *const fn (ptr: *anyopaque) void,
    // memory pressure functions
    getMemoryPressureThreshold: *const fn () f64,
    setMemoryPressureThreshold: *const fn (threshold: f64) void,
};
