#########################################################################
### ALL DATA NEGATIVE EXPONENTIAL WITH LOGNORMAL HYPERPARAMETER REGRESSION
#########################################################################
k.multi.ln.ind <- "
model{
#data level loop with mass loss as negative exponential process and normally distributed observation error at the parameter level
for (i in 1:n.obs){
  m[i]~dnorm(exp(-scale[species[i],plot[i]]*yr[i]),tau.ml)
  }

for(k in 1:n.spp){
		for (t in 1:8){
		scale[k,t]~dlnorm(alpha+
		beta.plot.1*(pred.plot.1[t]-mean.pred.plot.1)+beta.plot.2*(pred.plot.2[t]-mean.pred.plot.2)+beta.plot.3*(pred.plot.3[t]-mean.pred.plot.3)+beta.plot.4*(pred.plot.4[t]-mean.pred.plot.4)+beta.plot.5*(pred.plot.5[t]-mean.pred.plot.5)+
		beta.plot.6*(pred.plot.6[t]-mean.pred.plot.6)+beta.plot.7*(pred.plot.7[t]-mean.pred.plot.7)+beta.plot.8*(pred.plot.8[t]-mean.pred.plot.8)+beta.plot.9*(pred.plot.9[t]-mean.pred.plot.9)+beta.plot.10*(pred.plot.10[t]-mean.pred.plot.10)+
		beta.plot.11*(pred.plot.11[t]-mean.pred.plot.11)+
		beta.sp.1*(pred.sp.1[k]-mean.pred.sp.1)+beta.sp.2*(pred.sp.2[k]-mean.pred.sp.2)+beta.sp.3*(pred.sp.3[k]-mean.pred.sp.3)+beta.sp.4*(pred.sp.4[k]-mean.pred.sp.4)+beta.sp.5*(pred.sp.5[k]-mean.pred.sp.5)+
		beta.sp.6*(pred.sp.6[k]-mean.pred.sp.6)+beta.sp.7*(pred.sp.7[k]-mean.pred.sp.7)+beta.sp.8*(pred.sp.8[k]-mean.pred.sp.8)+beta.sp.9*(pred.sp.9[k]-mean.pred.sp.9)+beta.sp.10*(pred.sp.10[k]-mean.pred.sp.10)+
		beta.sp.11*(pred.sp.11[k]-mean.pred.sp.11)+beta.sp.12*(pred.sp.12[k]-mean.pred.sp.12)
		,tau.scale)
		}
	}
#prior for the data and hyperparameter level errors
tau.ml<-pow(sigma.ml,-2)
sigma.ml~dunif(0,10)
tau.scale<-pow(sigma.scale,-2)
sigma.scale~dunif(0,10)
#hyperparameters with latent indicators for model selection
beta.sp.1<-ind.s1*betaT.sp.1
beta.sp.2<-ind.s2*betaT.sp.2
beta.sp.3<-ind.s3*betaT.sp.3
beta.sp.4<-ind.s4*betaT.sp.4
beta.sp.5<-ind.s5*betaT.sp.5
beta.sp.6<-ind.s6*betaT.sp.6
beta.sp.7<-ind.s7*betaT.sp.7
beta.sp.8<-ind.s8*betaT.sp.8
beta.sp.9<-ind.s9*betaT.sp.9
beta.sp.10<-ind.s10*betaT.sp.10
beta.sp.11<-ind.s11*betaT.sp.11
beta.sp.12<-ind.s12*betaT.sp.12
beta.plot.1<-ind.p1*betaT.plot.1
beta.plot.2<-ind.p2*betaT.plot.2
beta.plot.3<-ind.p3*betaT.plot.3
beta.plot.4<-ind.p4*betaT.plot.4
beta.plot.5<-ind.p5*betaT.plot.5
beta.plot.6<-ind.p6*betaT.plot.6
beta.plot.7<-ind.p7*betaT.plot.7
beta.plot.8<-ind.p8*betaT.plot.8
beta.plot.9<-ind.p9*betaT.plot.9
beta.plot.10<-ind.p10*betaT.plot.10
beta.plot.11<-ind.p11*betaT.plot.11
#indicators as binary variables
ind.s1~dbern(pind)
ind.s2~dbern(pind)
ind.s3~dbern(pind)
ind.s4~dbern(pind)
ind.s5~dbern(pind)
ind.s6~dbern(pind)
ind.s7~dbern(pind)
ind.s8~dbern(pind)
ind.s9~dbern(pind)
ind.s10~dbern(pind)
ind.s11~dbern(pind)
ind.s12~dbern(pind)
ind.p1~dbern(pind)
ind.p2~dbern(pind)
ind.p3~dbern(pind)
ind.p4~dbern(pind)
ind.p5~dbern(pind)
ind.p6~dbern(pind)
ind.p7~dbern(pind)
ind.p8~dbern(pind)
ind.p9~dbern(pind)
ind.p10~dbern(pind)
ind.p11~dbern(pind)
#vague prior on the proportion of indicators included
pind~dbeta(0.5,0.5)
#priors for the hyperparameters
alpha~dnorm(0,0.01)
betaT.sp.1~dnorm(0,0.01)
betaT.sp.2~dnorm(0,0.01)
betaT.sp.3~dnorm(0,0.01)
betaT.sp.4~dnorm(0,0.01)
betaT.sp.5~dnorm(0,0.01)
betaT.sp.6~dnorm(0,0.01)
betaT.sp.7~dnorm(0,0.01)
betaT.sp.8~dnorm(0,0.01)
betaT.sp.9~dnorm(0,0.01)
betaT.sp.10~dnorm(0,0.01)
betaT.sp.11~dnorm(0,0.01)
betaT.sp.12~dnorm(0,0.01)
betaT.plot.1~dnorm(0,0.01)
betaT.plot.2~dnorm(0,0.01)
betaT.plot.3~dnorm(0,0.01)
betaT.plot.4~dnorm(0,0.01)
betaT.plot.5~dnorm(0,0.01)
betaT.plot.6~dnorm(0,0.01)
betaT.plot.7~dnorm(0,0.01)
betaT.plot.8~dnorm(0,0.01)
betaT.plot.9~dnorm(0,0.01)
betaT.plot.10~dnorm(0,0.01)
betaT.plot.11~dnorm(0,0.01)
#mean centering the predictors to reduce covariance between intercepts and slopes
mean.pred.sp.1<-mean(pred.sp.1[])
mean.pred.sp.2<-mean(pred.sp.2[])
mean.pred.sp.3<-mean(pred.sp.3[])
mean.pred.sp.4<-mean(pred.sp.4[])
mean.pred.sp.5<-mean(pred.sp.5[])
mean.pred.sp.6<-mean(pred.sp.6[])
mean.pred.sp.7<-mean(pred.sp.7[])
mean.pred.sp.8<-mean(pred.sp.8[])
mean.pred.sp.9<-mean(pred.sp.9[])
mean.pred.sp.10<-mean(pred.sp.10[])
mean.pred.sp.11<-mean(pred.sp.11[])
mean.pred.sp.12<-mean(pred.sp.12[])
mean.pred.plot.1<-mean(pred.plot.1[])
mean.pred.plot.2<-mean(pred.plot.2[])
mean.pred.plot.3<-mean(pred.plot.3[])
mean.pred.plot.4<-mean(pred.plot.4[])
mean.pred.plot.5<-mean(pred.plot.5[])
mean.pred.plot.6<-mean(pred.plot.6[])
mean.pred.plot.7<-mean(pred.plot.7[])
mean.pred.plot.8<-mean(pred.plot.8[])
mean.pred.plot.9<-mean(pred.plot.9[])
mean.pred.plot.10<-mean(pred.plot.10[])
mean.pred.plot.11<-mean(pred.plot.11[])
}
"
# initial values function for JAGS
j.inits <- function() {
    list(
        "alpha" = rlnorm(1, 0, 0.5),
        "betaT.plot.1" = rlnorm(1, -5, 0.1), "betaT.plot.2" = rlnorm(1, -5, 0.1), "betaT.plot.3" = rlnorm(1, -5, 0.1), "betaT.plot.4" = rlnorm(1, -5, 0.1), "betaT.plot.5" = rlnorm(1, -5, 0.1), "betaT.plot.6" = rlnorm(1, -5, 0.1), "betaT.plot.7" = rlnorm(1, -5, 0.1), "betaT.plot.8" = rlnorm(1, -5, 0.1), "betaT.plot.9" = rlnorm(1, -5, 0.1), "betaT.plot.10" = rlnorm(1, -5, 0.1), "betaT.plot.11" = rlnorm(1, -5, 0.1),
        "betaT.sp.1" = rlnorm(1, -5, 0.1), "betaT.sp.2" = rlnorm(1, -5, 0.1), "betaT.sp.3" = rlnorm(1, -5, 0.1), "betaT.sp.4" = rlnorm(1, -5, 0.1), "betaT.sp.5" = rlnorm(1, -5, 0.1), "betaT.sp.6" = rlnorm(1, -5, 0.1), "betaT.sp.7" = rlnorm(1, -5, 0.1), "betaT.sp.8" = rlnorm(1, -5, 0.1), "betaT.sp.9" = rlnorm(1, -5, 0.1), "betaT.sp.10" = rlnorm(1, -5, 0.1), "betaT.sp.11" = rlnorm(1, -5, 0.1), "betaT.sp.12" = rlnorm(1, -5, 0.1),
        "ind.s1" = runif(1), "ind.s2" = runif(1), "ind.s3" = runif(1), "ind.s4" = runif(1), "ind.s5" = runif(1), "ind.s6" = runif(1), "ind.s7" = runif(1), "ind.s8" = runif(1), "ind.s9" = runif(1), "ind.s10" = runif(1), "ind.s11" = runif(1), "ind.s12" = runif(1),
        "ind.p1" = runif(1), "ind.p2" = runif(1), "ind.p3" = runif(1), "ind.p4" = runif(1), "ind.p5" = runif(1), "ind.p6" = runif(1), "ind.p7" = runif(1), "ind.p8" = runif(1), "ind.p9" = runif(1), "ind.p10" = runif(1), "ind.p11" = runif(1),
        "pind" = runif(1), "sigma.ml" = runif(1), "sigma.scale" = runif(1)
    )
}

# data statement for JAGS
# species and plot covariates were scaled to have unit range prior to analysis
jags.data <- list(
    "m" = m, "yr" = yr, "species" = species, "plot" = plot, "n.obs" = length(m), "n.spp" = length(unique(species)),
    "pred.sp.1" = SPP[, 1], "pred.sp.2" = SPP[, 2], "pred.sp.3" = SPP[, 3], "pred.sp.4" = SPP[, 4], "pred.sp.5" = SPP[, 5], "pred.sp.6" = SPP[, 6], "pred.sp.7" = SPP[, 7], "pred.sp.8" = SPP[, 8], "pred.sp.9" = SPP[, 9], "pred.sp.10" = SPP[, 10], "pred.sp.11" = SPP[, 11], "pred.sp.12" = SPP[, 12], "pred.plot.1" = ENV[, 1], "pred.plot.2" = ENV[, 2], "pred.plot.3" = ENV[, 3], "pred.plot.4" = ENV[, 4], "pred.plot.5" = ENV[, 5], "pred.plot.6" = ENV[, 6], "pred.plot.7" = ENV[, 7], "pred.plot.8" = ENV[, 8], "pred.plot.9" = ENV[, 9], "pred.plot.10" = ENV[, 10], "pred.plot.11" = ENV[, 11]
)

# linking the model text
model <- textConnection(k.multi.ln.ind)

# adaptive burn-in of 10000 steps
jagsfit <- jags.model(model, data = jags.data, inits = j.inits, n.chains = 3, n.adapt = 10000, quiet = FALSE)

# variables to monitor
j.monitor <- c("pind", "alpha", "beta.plot.1", "beta.plot.2", "beta.plot.3", "beta.plot.4", "beta.plot.5", "beta.plot.6", "beta.plot.7", "beta.plot.8", "beta.plot.9", "beta.plot.10", "beta.plot.11", "beta.sp.1", "beta.sp.2", "beta.sp.3", "beta.sp.4", "beta.sp.5", "beta.sp.6", "beta.sp.7", "beta.sp.8", "beta.sp.9", "beta.sp.10", "beta.sp.11", "beta.sp.12", "sigma.ml", "sigma.scale")

#####################################################################
### ALL DATA WEIBULL WITH LOGNORMAL HYPERPARAMETER REGRESSION ON SHAPE
#####################################################################

w.multi.shape.ln.ind <- "
model{
#data level loop with mass loss as Weibull process with normally distributed observation error as a Weibull regression
for (i in 1:n.obs){
  m[i]~dnorm(exp(-exp(u[i])),tau.ml)
  u[i]<-shape[species[i],plot[i]]*log(yr[i])+log(scale[species[i],plot[i]])*shape[species[i],plot[i]] #Weibull regression for estimating plot- and species-level shape and scale parameters
  }
#hyperparameter regression loops for shape and scale. The regression must be done separately on each parameter to avoid multicolinearity in the Weibull regression
for(k in 1:n.spp){
		for (t in 1:8){
		scale[k,t]~dlnorm(alpha.scale,tau.scale) #the scaling by 10 makes the estimates more stable
		shape[k,t]~dlnorm(beta.plot.1*(pred.plot.1[t]-mean.pred.plot.1)+beta.plot.2*(pred.plot.2[t]-mean.pred.plot.2)+beta.plot.3*(pred.plot.3[t]-mean.pred.plot.3)+beta.plot.4*(pred.plot.4[t]-mean.pred.plot.4)+beta.plot.5*(pred.plot.5[t]-mean.pred.plot.5)+
		beta.plot.6*(pred.plot.6[t]-mean.pred.plot.6)+beta.plot.7*(pred.plot.7[t]-mean.pred.plot.7)+beta.plot.8*(pred.plot.8[t]-mean.pred.plot.8)+beta.plot.9*(pred.plot.9[t]-mean.pred.plot.9)+beta.plot.10*(pred.plot.10[t]-mean.pred.plot.10)+
		beta.plot.11*(pred.plot.11[t]-mean.pred.plot.11)+
		beta.sp.1*(pred.sp.1[k]-mean.pred.sp.1)+beta.sp.2*(pred.sp.2[k]-mean.pred.sp.2)+beta.sp.3*(pred.sp.3[k]-mean.pred.sp.3)+beta.sp.4*(pred.sp.4[k]-mean.pred.sp.4)+beta.sp.5*(pred.sp.5[k]-mean.pred.sp.5)+
		beta.sp.6*(pred.sp.6[k]-mean.pred.sp.6)+beta.sp.7*(pred.sp.7[k]-mean.pred.sp.7)+beta.sp.8*(pred.sp.8[k]-mean.pred.sp.8)+beta.sp.9*(pred.sp.9[k]-mean.pred.sp.9)+beta.sp.10*(pred.sp.10[k]-mean.pred.sp.10)+
		beta.sp.11*(pred.sp.11[k]-mean.pred.sp.11)+beta.sp.12*(pred.sp.12[k]-mean.pred.sp.12)
		,tau.shape)
		}
	}
#prior for the data and hyperparameter level errors
tau.ml<-pow(sigma.ml,-2)
sigma.ml~dunif(0,10)
tau.scale<-pow(sigma.scale,-2)
sigma.scale~dunif(0,10)
tau.shape<-pow(sigma.shape,-2)
sigma.shape~dunif(0,10)
#alpha.shape~dnorm(0,0.1)
alpha.scale~dnorm(0,0.01)
#hyperparameters with latent indicators for model selection
beta.sp.1<-ind.s1*betaT.sp.1
beta.sp.2<-ind.s2*betaT.sp.2
beta.sp.3<-ind.s3*betaT.sp.3
beta.sp.4<-ind.s4*betaT.sp.4
beta.sp.5<-ind.s5*betaT.sp.5
beta.sp.6<-ind.s6*betaT.sp.6
beta.sp.7<-ind.s7*betaT.sp.7
beta.sp.8<-ind.s8*betaT.sp.8
beta.sp.9<-ind.s9*betaT.sp.9
beta.sp.10<-ind.s10*betaT.sp.10
beta.sp.11<-ind.s11*betaT.sp.11
beta.sp.12<-ind.s12*betaT.sp.12
beta.plot.1<-ind.p1*betaT.plot.1
beta.plot.2<-ind.p2*betaT.plot.2
beta.plot.3<-ind.p3*betaT.plot.3
beta.plot.4<-ind.p4*betaT.plot.4
beta.plot.5<-ind.p5*betaT.plot.5
beta.plot.6<-ind.p6*betaT.plot.6
beta.plot.7<-ind.p7*betaT.plot.7
beta.plot.8<-ind.p8*betaT.plot.8
beta.plot.9<-ind.p9*betaT.plot.9
beta.plot.10<-ind.p10*betaT.plot.10
beta.plot.11<-ind.p11*betaT.plot.11
#indicators as binary variables
ind.s1~dbern(pind)
ind.s2~dbern(pind)
ind.s3~dbern(pind)
ind.s4~dbern(pind)
ind.s5~dbern(pind)
ind.s6~dbern(pind)
ind.s7~dbern(pind)
ind.s8~dbern(pind)
ind.s9~dbern(pind)
ind.s10~dbern(pind)
ind.s11~dbern(pind)
ind.s12~dbern(pind)
ind.p1~dbern(pind)
ind.p2~dbern(pind)
ind.p3~dbern(pind)
ind.p4~dbern(pind)
ind.p5~dbern(pind)
ind.p6~dbern(pind)
ind.p7~dbern(pind)
ind.p8~dbern(pind)
ind.p9~dbern(pind)
ind.p10~dbern(pind)
ind.p11~dbern(pind)
#vague prior on the proportion of indicators included
pind~dbeta(0.5,0.5)
#priors for the hyperparameters
alpha~dnorm(0,0.01)
betaT.sp.1~dnorm(0,0.01)
betaT.sp.2~dnorm(0,0.01)
betaT.sp.3~dnorm(0,0.01)
betaT.sp.4~dnorm(0,0.01)
betaT.sp.5~dnorm(0,0.01)
betaT.sp.6~dnorm(0,0.01)
betaT.sp.7~dnorm(0,0.01)
betaT.sp.8~dnorm(0,0.01)
betaT.sp.9~dnorm(0,0.01)
betaT.sp.10~dnorm(0,0.01)
betaT.sp.11~dnorm(0,0.01)
betaT.sp.12~dnorm(0,0.01)
betaT.plot.1~dnorm(0,0.01)
betaT.plot.2~dnorm(0,0.01)
betaT.plot.3~dnorm(0,0.01)
betaT.plot.4~dnorm(0,0.01)
betaT.plot.5~dnorm(0,0.01)
betaT.plot.6~dnorm(0,0.01)
betaT.plot.7~dnorm(0,0.01)
betaT.plot.8~dnorm(0,0.01)
betaT.plot.9~dnorm(0,0.01)
betaT.plot.10~dnorm(0,0.01)
betaT.plot.11~dnorm(0,0.01)
#mean centering the predictors to reduce covariance between intercepts and slopes
mean.pred.sp.1<-mean(pred.sp.1[])
mean.pred.sp.2<-mean(pred.sp.2[])
mean.pred.sp.3<-mean(pred.sp.3[])
mean.pred.sp.4<-mean(pred.sp.4[])
mean.pred.sp.5<-mean(pred.sp.5[])
mean.pred.sp.6<-mean(pred.sp.6[])
mean.pred.sp.7<-mean(pred.sp.7[])
mean.pred.sp.8<-mean(pred.sp.8[])
mean.pred.sp.9<-mean(pred.sp.9[])
mean.pred.sp.10<-mean(pred.sp.10[])
mean.pred.sp.11<-mean(pred.sp.11[])
mean.pred.sp.12<-mean(pred.sp.12[])
mean.pred.plot.1<-mean(pred.plot.1[])
mean.pred.plot.2<-mean(pred.plot.2[])
mean.pred.plot.3<-mean(pred.plot.3[])
mean.pred.plot.4<-mean(pred.plot.4[])
mean.pred.plot.5<-mean(pred.plot.5[])
mean.pred.plot.6<-mean(pred.plot.6[])
mean.pred.plot.7<-mean(pred.plot.7[])
mean.pred.plot.8<-mean(pred.plot.8[])
mean.pred.plot.9<-mean(pred.plot.9[])
mean.pred.plot.10<-mean(pred.plot.10[])
mean.pred.plot.11<-mean(pred.plot.11[])
}
"
# initial values function for JAGS
j.inits <- function() {
    list(
        "alpha.scale" = rlnorm(1, -5, 0.1),
        "betaT.plot.1" = rlnorm(1, -5, 0.1), "betaT.plot.2" = rlnorm(1, -5, 0.1), "betaT.plot.3" = rlnorm(1, -5, 0.1), "betaT.plot.4" = rlnorm(1, -5, 0.1), "betaT.plot.5" = rlnorm(1, -5, 0.1), "betaT.plot.6" = rlnorm(1, -5, 0.1), "betaT.plot.7" = rlnorm(1, -5, 0.1), "betaT.plot.8" = rlnorm(1, -5, 0.1), "betaT.plot.9" = rlnorm(1, -5, 0.1), "betaT.plot.10" = rlnorm(1, -5, 0.1), "betaT.plot.11" = rlnorm(1, -5, 0.1),
        "betaT.sp.1" = rlnorm(1, -5, 0.1), "betaT.sp.2" = rlnorm(1, -5, 0.1), "betaT.sp.3" = rlnorm(1, -5, 0.1), "betaT.sp.4" = rlnorm(1, -5, 0.1), "betaT.sp.5" = rlnorm(1, -5, 0.1), "betaT.sp.6" = rlnorm(1, -5, 0.1), "betaT.sp.7" = rlnorm(1, -5, 0.1), "betaT.sp.8" = rlnorm(1, -5, 0.1), "betaT.sp.9" = rlnorm(1, -5, 0.1), "betaT.sp.10" = rlnorm(1, -5, 0.1), "betaT.sp.11" = rlnorm(1, -5, 0.1), "betaT.sp.12" = rlnorm(1, -5, 0.1),
        "ind.s1" = runif(1), "ind.s2" = runif(1), "ind.s3" = runif(1), "ind.s4" = runif(1), "ind.s5" = runif(1), "ind.s6" = runif(1), "ind.s7" = runif(1), "ind.s8" = runif(1), "ind.s9" = runif(1), "ind.s10" = runif(1), "ind.s11" = runif(1), "ind.s12" = runif(1),
        "ind.p1" = runif(1), "ind.p2" = runif(1), "ind.p3" = runif(1), "ind.p4" = runif(1), "ind.p5" = runif(1), "ind.p6" = runif(1), "ind.p7" = runif(1), "ind.p8" = runif(1), "ind.p9" = runif(1), "ind.p10" = runif(1), "ind.p11" = runif(1),
        "pind" = runif(1), "sigma.ml" = runif(1), "sigma.scale" = runif(1), "sigma.shape" = runif(1)
    )
}

# data statement for JAGS
# species and plot covariates were scaled to have unit range prior to analysis
jags.data <- list(
    "m" = m, "yr" = yr, "species" = species, "plot" = plot, "n.obs" = length(m), "n.spp" = length(unique(species)),
    "pred.sp.1" = SPP[, 1], "pred.sp.2" = SPP[, 2], "pred.sp.3" = SPP[, 3], "pred.sp.4" = SPP[, 4], "pred.sp.5" = SPP[, 5], "pred.sp.6" = SPP[, 6], "pred.sp.7" = SPP[, 7], "pred.sp.8" = SPP[, 8], "pred.sp.9" = SPP[, 9], "pred.sp.10" = SPP[, 10], "pred.sp.11" = SPP[, 11], "pred.sp.12" = SPP[, 12], "pred.plot.1" = ENV[, 1], "pred.plot.2" = ENV[, 2], "pred.plot.3" = ENV[, 3], "pred.plot.4" = ENV[, 4], "pred.plot.5" = ENV[, 5], "pred.plot.6" = ENV[, 6], "pred.plot.7" = ENV[, 7], "pred.plot.8" = ENV[, 8], "pred.plot.9" = ENV[, 9], "pred.plot.10" = ENV[, 10], "pred.plot.11" = ENV[, 11]
)

# linking the model text
model <- textConnection(w.multi.shape.ln.ind)

# adaptive burn in of 10000 steps
jagsfit <- jags.model(model, data = jags.data, inits = j.inits, n.chains = 3, n.adapt = 10000, quiet = FALSE)

j.monitor <- c("pind", "alpha.scale", "beta.plot.1", "beta.plot.2", "beta.plot.3", "beta.plot.4", "beta.plot.5", "beta.plot.6", "beta.plot.7", "beta.plot.8", "beta.plot.9", "beta.plot.10", "beta.plot.11", "beta.sp.1", "beta.sp.2", "beta.sp.3", "beta.sp.4", "beta.sp.5", "beta.sp.6", "beta.sp.7", "beta.sp.8", "beta.sp.9", "beta.sp.10", "beta.sp.11", "beta.sp.12", "sigma.ml", "sigma.shape", "sigma.scale")
