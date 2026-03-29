#!/usr/bin/env bash

# DP-1: холоднее и чуть темнее
busctl --user set-property rs.wl-gammarelay /outputs/DP_1 rs.wl.gammarelay Brightness d 1.1
busctl --user set-property rs.wl-gammarelay /outputs/DP_1 rs.wl.gammarelay Gamma d 0.95
busctl --user set-property rs.wl-gammarelay /outputs/DP_1 rs.wl.gammarelay Temperature q 6500

# HDMI-A-1: теплее и ярче
busctl --user set-property rs.wl-gammarelay /outputs/HDMI_A_1 rs.wl.gammarelay Temperature q 5500
busctl --user set-property rs.wl-gammarelay /outputs/HDMI_A_1 rs.wl.gammarelay Brightness d 1.05
