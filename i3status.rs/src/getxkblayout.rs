use libc::{c_void, free};
use std::ffi::CStr;
use std::{mem, ptr};
use x11::xlib::{Bool, Display, XOpenDisplay, XkbGetState, _XkbStateRec};

/// X11/extensions/XKB.h
#[allow(non_upper_case_globals)]
const XkbUseCoreKbd: u32 = 0x0100;

#[repr(C)]
struct _XkbRF_VarDefs {
    model: *mut i8,
    layout: *mut i8,
    variant: *mut i8,
    options: *mut i8,
    sz_extra: u16,
    num_extra: u16,
    extra_names: *mut i8,
    extra_values: *mut *mut i8,
}

#[link(name = "X11")]
#[link(name = "xkbfile")]
extern "C" {
    fn XkbRF_GetNamesProp(dpy: *mut Display, rules_file_rtrn: *mut *mut i8, var_defs_rtrn: *mut _XkbRF_VarDefs) -> Bool;
}

pub struct GetXkbLayout {
    display: *mut Display,
    vd: _XkbRF_VarDefs,
}

impl GetXkbLayout {
    pub fn new() -> GetXkbLayout {
        let display = unsafe { XOpenDisplay(ptr::null()) };
        if display.is_null() {
            panic!("Couldn't open $DISPLAY");
        }
        GetXkbLayout {
            display: display,
            vd: unsafe { mem::zeroed() },
        }
    }

    pub fn current(&mut self) -> &str {
        let mut state = unsafe { mem::zeroed::<_XkbStateRec>() };
        unsafe { XkbGetState(self.display, XkbUseCoreKbd, &mut state) };

        unsafe { free(self.vd.model as *mut c_void) };
        unsafe { free(self.vd.layout as *mut c_void) };
        unsafe { free(self.vd.variant as *mut c_void) };
        unsafe { free(self.vd.options as *mut c_void) };
        unsafe { XkbRF_GetNamesProp(self.display, ptr::null_mut(), &mut self.vd) };

        let mut layout = unsafe { CStr::from_ptr(self.vd.layout).to_str().unwrap() };
        for _ in 0..state.group {
            if let Some(idx) = layout.find(',') {
                layout = &layout[idx + 1..];
            }
        }
        if let Some(idx) = layout.find(',') {
            layout = &layout[..idx];
        }
        layout
    }
}
