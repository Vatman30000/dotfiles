#!/usr/bin/env bash

STEP_BRIGHT=0.03
STEP_GAMMA=0.03

DIR="$1"

reset_outputs() {
  # нормальные значения
  busctl --user set-property rs.wl-gammarelay /outputs/DP_1 rs.wl.gammarelay Brightness d 1.0
  busctl --user set-property rs.wl-gammarelay /outputs/DP_1 rs.wl.gammarelay Gamma d 1.0
  busctl --user set-property rs.wl-gammarelay /outputs/HDMI_A_1 rs.wl.gammarelay Brightness d 1.0
  busctl --user set-property rs.wl-gammarelay /outputs/HDMI_A_1 rs.wl.gammarelay Gamma d 1.0
}

case "$DIR" in
up)
  busctl --user call rs.wl-gammarelay /outputs/DP_1 rs.wl.gammarelay UpdateBrightness d -- "$STEP_BRIGHT"
  busctl --user call rs.wl-gammarelay /outputs/DP_1 rs.wl.gammarelay UpdateGamma d -- "$STEP_GAMMA"
  busctl --user call rs.wl-gammarelay /outputs/HDMI_A_1 rs.wl.gammarelay UpdateBrightness d -- "$STEP_BRIGHT"
  busctl --user call rs.wl-gammarelay /outputs/HDMI_A_1 rs.wl.gammarelay UpdateGamma d -- "$STEP_GAMMA"
  ;;
down)
  NEG_BRIGHT="-${STEP_BRIGHT}"
  NEG_GAMMA="-${STEP_GAMMA}"
  busctl --user call rs.wl-gammarelay /outputs/DP_1 rs.wl.gammarelay UpdateBrightness d -- "$NEG_BRIGHT"
  busctl --user call rs.wl-gammarelay /outputs/DP_1 rs.wl.gammarelay UpdateGamma d -- "$NEG_GAMMA"
  busctl --user call rs.wl-gammarelay /outputs/HDMI_A_1 rs.wl.gammarelay UpdateBrightness d -- "$NEG_BRIGHT"
  busctl --user call rs.wl-gammarelay /outputs/HDMI_A_1 rs.wl.gammarelay UpdateGamma d -- "$NEG_GAMMA"
  ;;
reset)
  reset_outputs
  ;;
*)
  echo "usage: $0 up|down|reset"
  exit 1
  ;;
esac
