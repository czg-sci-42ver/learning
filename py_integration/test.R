library(reticulate)

Sys.setenv(LD_LIBRARY_PATH = paste0(Sys.getenv("HOME"), "/.virtualenvs/vsc/lib"))

Sys.getenv("LD_LIBRARY_PATH")
use_virtualenv(paste0(Sys.getenv("HOME"), "/.virtualenvs/vsc"), required = TRUE)

py_config()

# Currently this must be run in order for R-markdown plotting to work
matplotlib <- import("matplotlib")
matplotlib$use("Agg", force = TRUE)

# import matplotlib.pyplot as plt
# import numpy as np
# t = np.arange(0.0, 2.0, 0.01)
# s = 1 + np.sin(2*np.pi*t)
# plt.plot(t,s)
