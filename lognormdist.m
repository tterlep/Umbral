
function out = lognormdist(sigma,mu,r)

logr = log(r/(1-r));

out = (1/(sigma*sqrt(2*pi)))...
    *(1/(r*(1-r)))...
    *exp(-((logr-mu)^2)/(2*sigma^2));
