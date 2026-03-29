#!/usr/bin/env bash

# DP-1
busctl --user set-property rs.wl-gammarelay /outputs/DP_1 rs.wl.gammarelay Brightness d 0.88
busctl --user set-property rs.wl-gammarelay /outputs/DP_1 rs.wl.gammarelay Gamma d 0.88

# HDMI-A-1
busctl --user set-property rs.wl-gammarelay /outputs/HDMI_A_1 rs.wl.gammarelay Brightness d 0.91
busctl --user set-property rs.wl-gammarelay /outputs/HDMI_A_1 rs.wl.gammarelay Gamma d 0.91
